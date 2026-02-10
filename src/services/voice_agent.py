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
        whisper_size = os.getenv("WHISPER_MODEL", "tiny")
        logger.info(f"Loading Whisper {whisper_size} model...")
        self.whisper_model = whisper.load_model(whisper_size)

        # Initialize Ollama for NLU
        self.ollama_host = os.getenv("OLLAMA_HOST", "http://localhost:11434")
        self.ollama_model = os.getenv("OLLAMA_MODEL", "llama3.2:1b")
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

        system_prompt = f"""You are a customer service assistant for an e-commerce platform with payments support.
Your task is to understand the customer's query and determine what information is needed from the database.

Available database schema:
{available_tables}

You must respond ONLY with valid JSON format containing:
- intent: query type (order_status, product_info, product_search, customer_info, payment_info, card_status, general_inquiry)
- entities: extracted information (order_id, order_number, product_id, product_name, search_term, customer_id, email, user_id, card_id, card_type, tracking_number, price_range, etc.)
- query_type: type of SQL query needed
- friendly_response: a brief acknowledgment (max 1 sentence)

Examples:
- "Do you have iPhone 15 Pro?" -> {{"intent": "product_search", "entities": {{"search_term": "iPhone 15 Pro"}}, "query_type": "SELECT", "friendly_response": "Let me search for iPhone 15 Pro."}}
- "What products are under $100?" -> {{"intent": "product_search", "entities": {{"search_term": "", "price_max": 100}}, "query_type": "SELECT", "friendly_response": "Let me check our products under $100."}}
- "Order 123 status?" -> {{"intent": "order_status", "entities": {{"order_id": 123}}, "query_type": "SELECT", "friendly_response": "Let me check order 123."}}
- "Track my order ORD-5678" -> {{"intent": "order_status", "entities": {{"order_number": "ORD-5678"}}, "query_type": "SELECT", "friendly_response": "Let me track order ORD-5678."}}
- "How much is product 5?" -> {{"intent": "product_info", "entities": {{"product_id": 5}}, "query_type": "SELECT", "friendly_response": "Let me check product 5."}}
- "What cards does user 10 have?" -> {{"intent": "card_status", "entities": {{"user_id": 10}}, "query_type": "SELECT", "friendly_response": "Let me check the cards for user 10."}}
- "Do you accept Visa?" -> {{"intent": "payment_info", "entities": {{"card_type": "VISA"}}, "query_type": "SELECT", "friendly_response": "Let me check our accepted payment methods."}}
- "What payment methods do you accept?" -> {{"intent": "payment_info", "entities": {{}}, "query_type": "SELECT", "friendly_response": "Let me check our payment options."}}
- "Show me card 42" -> {{"intent": "card_status", "entities": {{"card_id": 42}}, "query_type": "SELECT", "friendly_response": "Let me look up card 42."}}
- "My orders for customer 3" -> {{"intent": "customer_info", "entities": {{"customer_id": 3}}, "query_type": "SELECT", "friendly_response": "Let me check orders for customer 3."}}

IMPORTANT: Respond ONLY with valid JSON, no additional text before or after."""

        user_prompt = f"Customer query: {user_text}"

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
                timeout=120
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
                "friendly_response": "I'm sorry, I couldn't understand your query. Could you rephrase it?"
            }
        except Exception as e:
            logger.error(f"Error in query understanding: {e}")
            return {
                "intent": "error",
                "entities": {},
                "query_type": "none",
                "friendly_response": "I'm sorry, I couldn't understand your query. Could you rephrase it?"
            }

    def fetch_database_info(self, understanding: Dict[str, Any]) -> Optional[Any]:
        """
        Fetch relevant information from the database based on understanding

        Args:
            understanding: Query understanding from NLU

        Returns:
            Database results or None
        """
        intent = understanding.get("intent")
        entities = understanding.get("entities", {})

        logger.info(f"Fetching data for intent: {intent}")

        try:
            if intent == "order_status":
                order_id = entities.get("order_id")
                order_number = entities.get("order_number") or entities.get("tracking_number")
                if order_id:
                    return self.db_manager.get_order_status(order_id)
                elif order_number:
                    return self.db_manager.get_order_tracking(order_number)

            elif intent == "product_info":
                product_id = entities.get("product_id")
                product_name = entities.get("product_name")
                if product_id:
                    return self.db_manager.get_product_info(product_id=product_id)
                elif product_name:
                    return self.db_manager.get_product_info(product_name=product_name)

            elif intent == "product_search":
                search_term = entities.get("search_term") or entities.get("product_name", "")
                if search_term:
                    return self.db_manager.search_products(search_term)

            elif intent == "customer_info":
                customer_id = entities.get("customer_id")
                email = entities.get("email")
                if customer_id:
                    return self.db_manager.get_customer_orders(customer_id)
                elif email:
                    return self.db_manager.get_customer_by_email(email)

            elif intent == "payment_info":
                # Card types or payment providers
                card_type = entities.get("card_type")
                if card_type:
                    # Return all card types so LLM can confirm if the specific one is accepted
                    return self.db_manager.get_card_types()
                else:
                    # General payment info: return both providers and card types
                    providers = self.db_manager.get_payment_providers()
                    card_types = self.db_manager.get_card_types()
                    return {"payment_providers": providers, "accepted_card_types": card_types}

            elif intent == "card_status":
                card_id = entities.get("card_id")
                user_id = entities.get("user_id")
                if card_id:
                    return self.db_manager.get_card_info(card_id)
                elif user_id:
                    return self.db_manager.get_cards_by_user(user_id)

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
            context = f"Database information: {db_data}"
        else:
            context = "No specific information found in the database."

        system_prompt = """You are a friendly and professional customer service assistant.
Generate a natural and helpful response based on the customer's query and available data.
The response must be clear, concise, and in a conversational tone suitable for voice reading.
Maximum 2-3 sentences.

IMPORTANT:
- Answer the customer's question directly with the most relevant information FIRST
- For order status: state the status clearly (Open, Done, Close, Cancel)
- For product info: state availability, price, or details requested
- For payment info: list accepted card types or payment providers
- For card status: report card type, status (Active/Inactive), and basic details
- Provide specific details from the database (prices, status, names, quantities, etc.)
- DO NOT ask follow-up questions if you already have complete data
- Speak naturally as if reading aloud"""

        user_prompt = f"""Customer query: {understanding.get('friendly_response', '')}
{context}

Generate an appropriate response for the customer using the database information provided."""

        try:
            # Call Ollama API
            response = requests.post(
                f"{self.ollama_host}/api/generate",
                json={
                    "model": self.ollama_model,
                    "prompt": f"{system_prompt}\n\n{user_prompt}",
                    "stream": False
                },
                timeout=120
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
            return "I'm sorry, there was a problem processing your query. Please try again."

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
