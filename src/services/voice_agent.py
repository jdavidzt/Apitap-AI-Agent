"""
Voice Customer Service Agent
Handles voice input, processes queries, and returns voice responses
"""

import os
import logging
from typing import Optional, Dict, Any
import numpy as np
import wave
import io

import whisper
import requests
import json as json_module
from TTS.api import TTS

from src.utils.audio_processor import AudioProcessor
from src.utils.database import DatabaseManager

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class VoiceCustomerServiceAgent:
    """
    Main agent for handling voice-based customer service interactions
    """

    def __init__(self):
        """Initialize the voice agent with all necessary components"""
        # Initialize Whisper for STT
        logger.info("Loading Whisper base model...")
        self.whisper_model = whisper.load_model("base")

        # Initialize Ollama for NLU (Llama 3.1)
        self.ollama_host = os.getenv("OLLAMA_HOST", "http://ollama:11434")
        self.ollama_model = os.getenv("OLLAMA_MODEL", "llama3.1:8b")
        logger.info(f"Using Ollama at {self.ollama_host} with model {self.ollama_model}")

        # Test Ollama connection
        try:
            response = requests.get(f"{self.ollama_host}/api/tags", timeout=5)
            if response.status_code == 200:
                logger.info("Ollama connection successful")
            else:
                logger.warning("Ollama connection test returned non-200 status")
        except Exception as e:
            logger.warning(f"Could not connect to Ollama: {e}")

        # Initialize Coqui TTS for text-to-speech
        logger.info("Loading Coqui TTS model...")
        tts_model = os.getenv("TTS_MODEL", "tts_models/es/css10/vits")
        self.tts = TTS(model_name=tts_model)
        logger.info(f"Loaded TTS model: {tts_model}")

        # Initialize database manager
        self.db_manager = DatabaseManager()

        # Initialize audio processor
        self.audio_processor = AudioProcessor()

        logger.info("Voice Customer Service Agent initialized successfully")

    def process_audio_file(self, audio_file_path: str) -> str:
        """
        Convert audio file to text using Whisper

        Args:
            audio_file_path: Path to the audio file

        Returns:
            Transcribed text
        """
        logger.info(f"Transcribing audio from {audio_file_path}")

        # Load and process audio using numpy and wave
        audio_data = self.audio_processor.load_audio(audio_file_path)

        # Transcribe using Whisper
        result = self.whisper_model.transcribe(audio_file_path)
        transcribed_text = result["text"]

        logger.info(f"Transcription: {transcribed_text}")
        return transcribed_text

    def process_audio_bytes(self, audio_bytes: bytes) -> str:
        """
        Convert audio bytes to text using Whisper

        Args:
            audio_bytes: Audio data as bytes

        Returns:
            Transcribed text
        """
        logger.info("Transcribing audio from bytes")

        # Convert bytes to numpy array using wave
        audio_array = self.audio_processor.bytes_to_array(audio_bytes)

        # Save temporarily for Whisper processing
        temp_path = "/tmp/temp_audio.wav"
        self.audio_processor.save_audio(audio_array, temp_path)

        # Transcribe
        result = self.whisper_model.transcribe(temp_path)
        transcribed_text = result["text"]

        logger.info(f"Transcription: {transcribed_text}")
        return transcribed_text

    def understand_query(self, user_text: str) -> Dict[str, Any]:
        """
        Use Llama 3.1 (via Ollama) to understand user intent and extract entities

        Args:
            user_text: Transcribed user query

        Returns:
            Dictionary with intent and extracted information
        """
        logger.info("Processing query with Llama 3.1 (Ollama)")

        # Get database context for better understanding
        available_tables = self.db_manager.get_table_info()

        system_prompt = f"""Eres un asistente de servicio al cliente para un e-commerce.
Tu tarea es entender la consulta del cliente y determinar qué información necesita de la base de datos.

Tablas disponibles en la base de datos:
{available_tables}

Debes responder ÚNICAMENTE en formato JSON válido con:
- intent: el tipo de consulta (order_status, product_info, customer_info, general_inquiry)
- entities: información extraída (order_id, product_id, customer_id, etc.)
- query_type: tipo de consulta SQL necesaria
- friendly_response: una respuesta amigable para el cliente

Si el cliente pregunta por el estado de un pedido, productos, historial de compras, etc.,
identifica los datos relevantes y estructura la respuesta.

IMPORTANTE: Responde SOLO con el JSON válido, sin texto adicional antes o después."""

        user_prompt = f"Consulta del cliente: {user_text}"

        try:
            # Call Ollama API
            response = requests.post(
                f"{self.ollama_host}/api/generate",
                json={
                    "model": self.ollama_model,
                    "prompt": f"{system_prompt}\n\n{user_prompt}",
                    "stream": False,
                    "format": "json"
                },
                timeout=30
            )

            if response.status_code != 200:
                logger.error(f"Ollama API error: {response.status_code}")
                raise Exception(f"Ollama API returned status {response.status_code}")

            result = response.json()
            response_text = result.get("response", "")

            # Parse JSON response
            understanding = json_module.loads(response_text)
            logger.info(f"Query understanding: {understanding}")
            return understanding

        except json_module.JSONDecodeError as e:
            logger.error(f"Failed to parse JSON response: {e}")
            logger.error(f"Response was: {response_text if 'response_text' in locals() else 'N/A'}")
            return {
                "intent": "error",
                "entities": {},
                "query_type": "none",
                "friendly_response": "Lo siento, no pude entender tu consulta. ¿Podrías repetirla de otra manera?"
            }
        except Exception as e:
            logger.error(f"Error in query understanding: {e}")
            return {
                "intent": "error",
                "entities": {},
                "query_type": "none",
                "friendly_response": "Lo siento, no pude entender tu consulta. ¿Podrías repetirla de otra manera?"
            }

    def fetch_database_info(self, understanding: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """
        Fetch relevant information from the database based on understanding

        Args:
            understanding: Query understanding from GPT-4o mini

        Returns:
            Database results or None
        """
        intent = understanding.get("intent")
        entities = understanding.get("entities", {})

        logger.info(f"Fetching data for intent: {intent}")

        try:
            if intent == "order_status":
                order_id = entities.get("order_id")
                if order_id:
                    return self.db_manager.get_order_status(order_id)

            elif intent == "product_info":
                product_id = entities.get("product_id")
                product_name = entities.get("product_name")
                if product_id:
                    return self.db_manager.get_product_info(product_id=product_id)
                elif product_name:
                    return self.db_manager.get_product_info(product_name=product_name)

            elif intent == "customer_info":
                customer_id = entities.get("customer_id")
                email = entities.get("email")
                if customer_id:
                    return self.db_manager.get_customer_orders(customer_id)
                elif email:
                    return self.db_manager.get_customer_by_email(email)

            return None

        except Exception as e:
            logger.error(f"Database fetch error: {e}")
            return None

    def generate_response(self, understanding: Dict[str, Any], db_data: Optional[Dict[str, Any]]) -> str:
        """
        Generate a friendly response using Llama 3.1 (via Ollama)

        Args:
            understanding: Query understanding
            db_data: Data from database

        Returns:
            Response text
        """
        logger.info("Generating response with Llama 3.1 (Ollama)")

        if db_data:
            context = f"Información de la base de datos: {db_data}"
        else:
            context = "No se encontró información específica en la base de datos."

        system_prompt = """Eres un asistente de servicio al cliente amigable y profesional.
Genera una respuesta natural y útil basada en la consulta del cliente y los datos disponibles.
La respuesta debe ser clara, concisa y en un tono conversacional apropiado para ser leída en voz alta.
Máximo 3-4 oraciones."""

        user_prompt = f"""Consulta del cliente: {understanding.get('friendly_response', '')}
{context}

Genera una respuesta apropiada para el cliente."""

        try:
            # Call Ollama API
            response = requests.post(
                f"{self.ollama_host}/api/generate",
                json={
                    "model": self.ollama_model,
                    "prompt": f"{system_prompt}\n\n{user_prompt}",
                    "stream": False
                },
                timeout=30
            )

            if response.status_code != 200:
                logger.error(f"Ollama API error: {response.status_code}")
                raise Exception(f"Ollama API returned status {response.status_code}")

            result = response.json()
            response_text = result.get("response", "").strip()

            logger.info(f"Generated response: {response_text}")
            return response_text

        except Exception as e:
            logger.error(f"Error generating response: {e}")
            return "Lo siento, hubo un problema al procesar tu consulta. Por favor, intenta de nuevo."

    def text_to_speech(self, text: str, output_path: str = "/tmp/response.wav") -> str:
        """
        Convert text response to speech using Coqui TTS

        Args:
            text: Text to convert
            output_path: Path to save audio file (WAV format)

        Returns:
            Path to audio file
        """
        logger.info("Converting text to speech with Coqui TTS")

        try:
            # Generate audio using Coqui TTS
            # Coqui TTS outputs WAV files by default
            self.tts.tts_to_file(
                text=text,
                file_path=output_path
            )

            logger.info(f"Audio saved to {output_path}")
            return output_path

        except Exception as e:
            logger.error(f"Error in text-to-speech: {e}")
            raise

    def process_voice_query(self, audio_input, output_path: str = "/tmp/response.wav") -> tuple[str, str]:
        """
        Complete pipeline: voice input -> processing -> voice output

        Args:
            audio_input: Either file path (str) or audio bytes
            output_path: Path for output audio

        Returns:
            Tuple of (response_text, audio_file_path)
        """
        logger.info("Processing complete voice query pipeline")

        # Step 1: Speech to Text
        if isinstance(audio_input, str):
            transcribed_text = self.process_audio_file(audio_input)
        else:
            transcribed_text = self.process_audio_bytes(audio_input)

        # Step 2: Understand query with NLU
        understanding = self.understand_query(transcribed_text)

        # Step 3: Fetch database information
        db_data = self.fetch_database_info(understanding)

        # Step 4: Generate response
        response_text = self.generate_response(understanding, db_data)

        # Step 5: Text to Speech
        audio_path = self.text_to_speech(response_text, output_path)

        logger.info("Voice query processing completed successfully")
        return response_text, audio_path

    def cleanup(self):
        """Clean up resources"""
        if self.db_manager:
            self.db_manager.close()
        logger.info("Cleanup completed")


if __name__ == "__main__":
    # Example usage
    agent = VoiceCustomerServiceAgent()

    # Process a voice query
    # response_text, audio_file = agent.process_voice_query("path/to/audio.wav")
    # print(f"Response: {response_text}")
    # print(f"Audio saved to: {audio_file}")

    agent.cleanup()
