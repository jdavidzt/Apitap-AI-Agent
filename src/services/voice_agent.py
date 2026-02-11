"""
Voice Customer Service Agent - Multi-Profile Support
Handles voice/text input, processes queries per user profile, returns voice responses.
Profiles: Consumer, Merchant, Reseller, Admin
"""

import os
import time
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
from src.utils.database import DatabaseManager, PROFILE_CAPABILITIES

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Profile-specific intent lists for NLU
PROFILE_INTENTS = {
    "consumer": ["product_search", "product_info", "order_status", "payment_info", "store_locations", "table_availability", "general_inquiry"],
    "merchant": ["sales_summary", "top_products", "bottom_products", "sales_by_location", "recent_orders", "inventory_status", "order_status", "general_inquiry"],
    "reseller": ["merchant_list", "merchant_performance", "equipment_summary", "subscription_overview", "general_inquiry"],
    "admin": ["platform_stats", "user_counts", "order_overview", "revenue_report", "merchant_list", "general_inquiry"],
}


class VoiceCustomerServiceAgent:
    """Main agent for handling voice-based customer service interactions"""

    def __init__(self):
        # Initialize Whisper for STT
        whisper_size = os.getenv("WHISPER_MODEL", "tiny")
        logger.info(f"Loading Whisper {whisper_size} model...")
        self.whisper_model = whisper.load_model(whisper_size)

        # Initialize Ollama for NLU
        self.ollama_host = os.getenv("OLLAMA_HOST", "http://localhost:11434")
        self.ollama_model = os.getenv("OLLAMA_MODEL", "llama3.2:1b")
        logger.info(f"Using Ollama at {self.ollama_host} with model {self.ollama_model}")

        try:
            response = requests.get(f"{self.ollama_host}/api/tags", timeout=5)
            if response.status_code == 200:
                logger.info("Ollama connection successful")
        except Exception as e:
            logger.warning(f"Could not connect to Ollama: {e}")

        # Initialize Coqui TTS
        logger.info("Loading Coqui TTS model...")
        tts_model = os.getenv("TTS_MODEL", "tts_models/es/css10/vits")
        self.tts = TTS(model_name=tts_model)
        logger.info(f"Loaded TTS model: {tts_model}")

        # Initialize database manager
        self.db_manager = DatabaseManager()

        # Initialize audio processor
        self.audio_processor = AudioProcessor()

        logger.info("Voice Customer Service Agent initialized (multi-profile)")

    def process_audio_file(self, audio_file_path: str) -> str:
        logger.info(f"Transcribing audio from {audio_file_path}")
        result = self.whisper_model.transcribe(audio_file_path)
        transcribed_text = result["text"]
        logger.info(f"Transcription: {transcribed_text}")
        return transcribed_text

    def process_audio_bytes(self, audio_bytes: bytes) -> str:
        logger.info("Transcribing audio from bytes")
        audio_array = self.audio_processor.bytes_to_array(audio_bytes)
        temp_path = "/tmp/temp_audio.wav"
        self.audio_processor.save_audio(audio_array, temp_path)
        result = self.whisper_model.transcribe(temp_path)
        transcribed_text = result["text"]
        logger.info(f"Transcription: {transcribed_text}")
        return transcribed_text

    def _build_nlu_prompt(self, profile: str) -> str:
        """Build profile-specific NLU system prompt"""
        available_tables = self.db_manager.get_table_info()
        intents = PROFILE_INTENTS.get(profile, PROFILE_INTENTS["consumer"])
        intent_str = ", ".join(intents)

        # Profile-specific examples
        examples = {
            "consumer": """
- "Do you have iPhone 15?" -> {{"intent": "product_search", "entities": {{"search_term": "iPhone 15"}}, "friendly_response": "Let me search for iPhone 15."}}
- "Order 123 status?" -> {{"intent": "order_status", "entities": {{"order_id": 123}}, "friendly_response": "Let me check order 123."}}
- "What payment methods?" -> {{"intent": "payment_info", "entities": {{}}, "friendly_response": "Let me check our payment options."}}
- "Stores near me" -> {{"intent": "store_locations", "entities": {{}}, "friendly_response": "Let me find nearby stores."}}
- "Available tables?" -> {{"intent": "table_availability", "entities": {{}}, "friendly_response": "Let me check table availability."}}
- "Tables at location 5" -> {{"intent": "table_availability", "entities": {{"location_id": 5}}, "friendly_response": "Let me check tables at that location."}}""",
            "merchant": """
- "How are my sales this month?" -> {{"intent": "sales_summary", "entities": {{"period": "monthly", "merchant_id": 1}}, "friendly_response": "Let me pull your monthly sales."}}
- "Weekly sales" -> {{"intent": "sales_summary", "entities": {{"period": "weekly", "merchant_id": 1}}, "friendly_response": "Here are your weekly sales."}}
- "Top selling products" -> {{"intent": "top_products", "entities": {{"merchant_id": 1}}, "friendly_response": "Let me check your best sellers."}}
- "Least sold items" -> {{"intent": "bottom_products", "entities": {{"merchant_id": 1}}, "friendly_response": "Let me find your slowest items."}}
- "Sales by store" -> {{"intent": "sales_by_location", "entities": {{"merchant_id": 1}}, "friendly_response": "Let me break down sales by location."}}
- "Recent orders" -> {{"intent": "recent_orders", "entities": {{"merchant_id": 1}}, "friendly_response": "Here are your latest orders."}}
- "Low stock items" -> {{"intent": "inventory_status", "entities": {{"merchant_id": 1, "low_stock": true}}, "friendly_response": "Let me check low stock alerts."}}""",
            "reseller": """
- "Show my merchants" -> {{"intent": "merchant_list", "entities": {{"reseller_id": 1}}, "friendly_response": "Let me list your merchants."}}
- "How are my merchants doing?" -> {{"intent": "merchant_performance", "entities": {{"reseller_id": 1}}, "friendly_response": "Let me check merchant performance."}}
- "Equipment summary" -> {{"intent": "equipment_summary", "entities": {{"reseller_id": 1}}, "friendly_response": "Here is your equipment overview."}}
- "Subscription tiers" -> {{"intent": "subscription_overview", "entities": {{"reseller_id": 1}}, "friendly_response": "Let me check subscriptions."}}""",
            "admin": """
- "Platform stats" -> {{"intent": "platform_stats", "entities": {{}}, "friendly_response": "Let me pull platform statistics."}}
- "How many users?" -> {{"intent": "user_counts", "entities": {{}}, "friendly_response": "Let me check user counts."}}
- "Order breakdown" -> {{"intent": "order_overview", "entities": {{}}, "friendly_response": "Here is the order breakdown."}}
- "Revenue this month" -> {{"intent": "revenue_report", "entities": {{"period": "monthly"}}, "friendly_response": "Let me pull revenue data."}}
- "List all merchants" -> {{"intent": "merchant_list", "entities": {{}}, "friendly_response": "Here are all merchants."}}"""
        }

        profile_label = PROFILE_CAPABILITIES.get(profile, {}).get("label", "Customer")

        return f"""You are a customer service assistant for an e-commerce platform.
The current user is a **{profile_label}**.

Available database schema:
{available_tables}

You must respond ONLY with valid JSON format containing:
- intent: one of [{intent_str}]
- entities: extracted information (order_id, merchant_id, reseller_id, search_term, period, location_id, etc.)
- friendly_response: a brief acknowledgment (max 1 sentence)

Examples for {profile_label}:
{examples.get(profile, examples['consumer'])}

IMPORTANT: Respond ONLY with valid JSON, no additional text."""

    def understand_query(self, user_text: str, profile: str = "consumer") -> Dict[str, Any]:
        """Use Ollama to understand user intent based on profile"""
        logger.info(f"Processing query for profile '{profile}': {user_text}")

        system_prompt = self._build_nlu_prompt(profile)
        user_prompt = f"Customer query: {user_text}"

        try:
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
                raise Exception(f"Ollama API returned status {response.status_code}")

            result = response.json()
            response_text = result.get("response", "")
            understanding = json_module.loads(response_text)
            logger.info(f"Query understanding: {understanding}")
            return understanding

        except json_module.JSONDecodeError as e:
            logger.error(f"Failed to parse JSON: {e}")
            return {"intent": "error", "entities": {},
                    "friendly_response": "I couldn't understand your query. Could you rephrase it?"}
        except Exception as e:
            logger.error(f"Error in query understanding: {e}")
            return {"intent": "error", "entities": {},
                    "friendly_response": "I couldn't understand your query. Could you rephrase it?"}

    def fetch_database_info(self, understanding: Dict[str, Any], profile: str = "consumer",
                            user_context: Dict = None) -> Optional[Any]:
        """Fetch data based on intent and profile"""
        intent = understanding.get("intent")
        entities = understanding.get("entities", {})
        ctx = user_context or {}

        logger.info(f"Fetching data for intent: {intent} (profile: {profile})")

        try:
            # --- CONSUMER intents ---
            if intent == "order_status":
                order_id = entities.get("order_id")
                order_number = entities.get("order_number")
                if order_id:
                    return self.db_manager.get_order_status(order_id)
                elif order_number:
                    return self.db_manager.get_order_by_number(order_number)

            elif intent == "product_info":
                pid = entities.get("product_id")
                pname = entities.get("product_name")
                if pid:
                    return self.db_manager.get_product_info(product_id=pid)
                elif pname:
                    return self.db_manager.get_product_info(product_name=pname)

            elif intent == "product_search":
                term = entities.get("search_term") or entities.get("product_name", "")
                if term:
                    return self.db_manager.search_products(term)

            elif intent == "payment_info":
                providers = self.db_manager.get_payment_providers()
                card_types = self.db_manager.get_card_types()
                return {"payment_providers": providers, "accepted_card_types": card_types}

            elif intent == "store_locations":
                lat = entities.get("latitude") or ctx.get("latitude")
                lng = entities.get("longitude") or ctx.get("longitude")
                return self.db_manager.get_store_locations(lat=lat, lng=lng)

            elif intent == "table_availability":
                loc_id = entities.get("location_id")
                return self.db_manager.get_table_availability(location_id=loc_id)

            # --- MERCHANT intents ---
            elif intent == "sales_summary":
                mid = entities.get("merchant_id") or ctx.get("merchant_id", 1)
                period = entities.get("period", "monthly")
                return self.db_manager.get_merchant_sales(mid, period)

            elif intent == "top_products":
                mid = entities.get("merchant_id") or ctx.get("merchant_id", 1)
                return self.db_manager.get_merchant_top_products(mid)

            elif intent == "bottom_products":
                mid = entities.get("merchant_id") or ctx.get("merchant_id", 1)
                return self.db_manager.get_merchant_top_products(mid, bottom=True)

            elif intent == "sales_by_location":
                mid = entities.get("merchant_id") or ctx.get("merchant_id", 1)
                return self.db_manager.get_merchant_sales_by_location(mid)

            elif intent == "recent_orders":
                mid = entities.get("merchant_id") or ctx.get("merchant_id", 1)
                return self.db_manager.get_merchant_recent_orders(mid)

            elif intent == "inventory_status":
                mid = entities.get("merchant_id") or ctx.get("merchant_id", 1)
                low_only = entities.get("low_stock", False)
                return self.db_manager.get_merchant_inventory(mid, low_stock_only=low_only)

            # --- RESELLER intents ---
            elif intent == "merchant_list" and profile == "reseller":
                rid = entities.get("reseller_id") or ctx.get("reseller_id", 1)
                return self.db_manager.get_reseller_merchants(rid)

            elif intent == "merchant_performance":
                rid = entities.get("reseller_id") or ctx.get("reseller_id", 1)
                return self.db_manager.get_reseller_performance(rid)

            elif intent == "equipment_summary":
                rid = entities.get("reseller_id") or ctx.get("reseller_id", 1)
                return self.db_manager.get_reseller_equipment_summary(rid)

            elif intent == "subscription_overview":
                rid = entities.get("reseller_id") or ctx.get("reseller_id", 1)
                return self.db_manager.get_reseller_subscription_overview(rid)

            # --- ADMIN intents ---
            elif intent == "platform_stats":
                return self.db_manager.get_platform_stats()

            elif intent == "user_counts":
                return self.db_manager.get_admin_user_counts()

            elif intent == "order_overview":
                return self.db_manager.get_admin_order_overview()

            elif intent == "revenue_report":
                period = entities.get("period", "monthly")
                return self.db_manager.get_admin_revenue_by_period(period)

            elif intent == "merchant_list" and profile == "admin":
                return self.db_manager.get_admin_all_merchants()

            # --- FALLBACK: consumer-like for general inquiry ---
            elif intent == "customer_info":
                cid = entities.get("customer_id")
                if cid:
                    return self.db_manager.get_customer_orders(cid)

            return None

        except Exception as e:
            logger.error(f"Database fetch error: {e}")
            return None

    def generate_response(self, understanding: Dict[str, Any], db_data: Optional[Dict],
                          profile: str = "consumer") -> str:
        """Generate a friendly response using Ollama"""
        logger.info("Generating response with Ollama")

        context = f"Database information: {db_data}" if db_data else "No specific information found in the database."
        profile_label = PROFILE_CAPABILITIES.get(profile, {}).get("label", "Customer")

        system_prompt = f"""You are Max, a friendly and professional customer service assistant.
The user is a **{profile_label}**.
Generate a natural, helpful response based on the query and available data.
Maximum 2-3 sentences. Be concise and conversational.

IMPORTANT:
- Answer the question directly with the most relevant information FIRST
- Provide specific details from the database (numbers, names, prices, status)
- DO NOT ask follow-up questions if you have complete data
- Speak naturally as if reading aloud"""

        user_prompt = f"""Customer query: {understanding.get('friendly_response', '')}
{context}

Generate an appropriate response using the database information."""

        try:
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
                raise Exception(f"Ollama API returned status {response.status_code}")

            result = response.json()
            response_text = result.get("response", "").strip()
            logger.info(f"Generated response: {response_text}")
            return response_text

        except Exception as e:
            logger.error(f"Error generating response: {e}")
            return "I'm sorry, there was a problem processing your query. Please try again."

    def text_to_speech(self, text: str, output_path: str = "/tmp/response.wav") -> str:
        logger.info("Converting text to speech with Coqui TTS")
        try:
            self.tts.tts_to_file(text=text, file_path=output_path)
            logger.info(f"Audio saved to {output_path}")
            return output_path
        except Exception as e:
            logger.error(f"Error in text-to-speech: {e}")
            raise

    def process_voice_query(self, audio_input, profile: str = "consumer",
                            user_context: Dict = None,
                            output_path: str = "/tmp/response.wav") -> tuple[str, str, Dict]:
        """Complete pipeline: voice input -> processing -> voice output"""
        logger.info(f"Processing voice query pipeline (profile: {profile})")
        start_time = time.time()

        # Step 1: Speech to Text
        if isinstance(audio_input, str):
            transcribed_text = self.process_audio_file(audio_input)
        else:
            transcribed_text = self.process_audio_bytes(audio_input)

        # Step 2: Understand query with profile-aware NLU
        understanding = self.understand_query(transcribed_text, profile)

        # Step 3: Fetch database information
        db_data = self.fetch_database_info(understanding, profile, user_context)

        # Step 4: Generate response
        response_text = self.generate_response(understanding, db_data, profile)

        # Step 5: Text to Speech
        audio_path = self.text_to_speech(response_text, output_path)

        elapsed_ms = int((time.time() - start_time) * 1000)

        # Step 6: Log the query
        self.db_manager.log_query(
            profile=profile,
            user_id=str((user_context or {}).get("user_id", "unknown")),
            query_text=transcribed_text,
            intent=understanding.get("intent", "unknown"),
            response_text=response_text,
            db_data_found=db_data is not None,
            response_time_ms=elapsed_ms,
            input_method="voice"
        )

        logger.info(f"Voice query completed in {elapsed_ms}ms")
        return response_text, audio_path, understanding

    def process_text_query(self, text: str, profile: str = "consumer",
                           user_context: Dict = None) -> Dict[str, Any]:
        """Process a text query and return structured result"""
        start_time = time.time()

        understanding = self.understand_query(text, profile)
        db_data = self.fetch_database_info(understanding, profile, user_context)
        response_text = self.generate_response(understanding, db_data, profile)

        elapsed_ms = int((time.time() - start_time) * 1000)

        # Log the query
        self.db_manager.log_query(
            profile=profile,
            user_id=str((user_context or {}).get("user_id", "unknown")),
            query_text=text,
            intent=understanding.get("intent", "unknown"),
            response_text=response_text,
            db_data_found=db_data is not None,
            response_time_ms=elapsed_ms,
            input_method="text"
        )

        return {
            "response_text": response_text,
            "understanding": understanding,
            "db_data": db_data,
            "elapsed_ms": elapsed_ms
        }

    def cleanup(self):
        if self.db_manager:
            self.db_manager.close()
        logger.info("Cleanup completed")
