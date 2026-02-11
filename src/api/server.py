"""
FastAPI server for Voice Customer Service Agent - Multi-Profile Support
Version 3.1.0
"""

from fastapi import FastAPI, File, UploadFile, HTTPException, Form
from fastapi.responses import FileResponse
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
import logging
import os
import tempfile
from typing import Dict, Any, Optional

from src.services.voice_agent import VoiceCustomerServiceAgent
from src.utils.database import PROFILE_CAPABILITIES

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = FastAPI(
    title="Apitap Customer Service Agent",
    description="Multi-profile voice & text customer service for e-commerce",
    version="3.1.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

static_path = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(__file__))), "static")
if os.path.exists(static_path):
    app.mount("/static", StaticFiles(directory=static_path), name="static")

agent = None


@app.on_event("startup")
async def startup_event():
    global agent
    logger.info("Starting Customer Service Agent...")
    try:
        agent = VoiceCustomerServiceAgent()
        logger.info("Agent initialized successfully (multi-profile)")
    except Exception as e:
        logger.error(f"Failed to initialize agent: {e}")
        raise


@app.on_event("shutdown")
async def shutdown_event():
    global agent
    if agent:
        agent.cleanup()
    logger.info("Agent shut down")


@app.get("/")
async def root():
    index_path = os.path.join(static_path, "index.html")
    if os.path.exists(index_path):
        return FileResponse(index_path)
    return {"message": "Apitap Customer Service Agent", "version": "3.1.0"}


@app.get("/api")
async def api_info():
    return {
        "message": "Apitap Customer Service Agent",
        "version": "3.1.0",
        "profiles": list(PROFILE_CAPABILITIES.keys()),
        "status": "running"
    }


@app.get("/health")
async def health_check():
    return {
        "status": "healthy",
        "agent_initialized": agent is not None,
        "stt": "Whisper tiny",
        "nlu": "Llama 3.2 1B via Ollama",
        "tts": "Coqui TTS",
        "profiles": list(PROFILE_CAPABILITIES.keys())
    }


# ==================================================================
# Profile & Capabilities
# ==================================================================

@app.get("/capabilities")
async def get_capabilities(profile: Optional[str] = None):
    """Get capability inventory for all profiles or a specific one"""
    if profile:
        if profile not in PROFILE_CAPABILITIES:
            raise HTTPException(status_code=400, detail=f"Invalid profile: {profile}")
        return {profile: PROFILE_CAPABILITIES[profile]}
    return PROFILE_CAPABILITIES


# ==================================================================
# Text Query (with profile)
# ==================================================================

@app.post("/text-query")
async def text_query(query: Dict[str, Any]) -> Dict[str, Any]:
    """Process text query with profile context"""
    if not agent:
        raise HTTPException(status_code=503, detail="Agent not initialized")

    try:
        text = query.get("text")
        if not text:
            raise HTTPException(status_code=400, detail="Text field is required")

        profile = query.get("profile", "consumer")
        user_context = query.get("user_context", {})

        # Use the new process_text_query method
        result = agent.process_text_query(text, profile, user_context)

        # Convert to speech
        output_path = tempfile.mktemp(suffix=".wav")
        audio_path = agent.text_to_speech(result["response_text"], output_path)

        return {
            "success": True,
            "response_text": result["response_text"],
            "understanding": result["understanding"],
            "database_data": result["db_data"],
            "elapsed_ms": result["elapsed_ms"],
            "audio_url": f"/download-audio?path={audio_path}"
        }

    except Exception as e:
        logger.error(f"Error processing text query: {e}")
        raise HTTPException(status_code=500, detail=str(e))


# ==================================================================
# Voice Query (with profile)
# ==================================================================

@app.post("/process-voice")
async def process_voice(
    audio: UploadFile = File(...),
    profile: str = Form(default="consumer"),
    user_context: str = Form(default="{}")
) -> Dict[str, Any]:
    """Process voice input with profile context"""
    if not agent:
        raise HTTPException(status_code=503, detail="Agent not initialized")

    try:
        import json
        ctx = json.loads(user_context) if user_context else {}

        with tempfile.NamedTemporaryFile(delete=False, suffix=".wav") as temp_audio:
            content = await audio.read()
            temp_audio.write(content)
            temp_audio_path = temp_audio.name

        transcription = agent.process_audio_file(temp_audio_path)
        output_path = tempfile.mktemp(suffix=".wav")

        response_text, audio_path, understanding = agent.process_voice_query(
            temp_audio_path, profile, ctx, output_path
        )

        os.unlink(temp_audio_path)

        return {
            "success": True,
            "transcription": transcription,
            "response_text": response_text,
            "understanding": understanding,
            "audio_url": f"/download-audio?path={audio_path}"
        }

    except Exception as e:
        logger.error(f"Error processing voice: {e}")
        raise HTTPException(status_code=500, detail=str(e))


# ==================================================================
# Query Logs
# ==================================================================

@app.get("/query-logs")
async def get_query_logs(limit: int = 50, profile: Optional[str] = None):
    """Get recent query logs for monitoring"""
    if not agent:
        raise HTTPException(status_code=503, detail="Agent not initialized")
    logs = agent.db_manager.get_query_logs(limit=limit, profile=profile)
    return {"logs": logs, "count": len(logs)}


@app.get("/query-stats")
async def get_query_stats():
    """Get aggregated query stats by profile"""
    if not agent:
        raise HTTPException(status_code=503, detail="Agent not initialized")
    stats = agent.db_manager.get_log_stats()
    return {"stats": stats}


# ==================================================================
# Audio
# ==================================================================

@app.get("/download-audio")
async def download_audio(path: str):
    if not os.path.exists(path):
        raise HTTPException(status_code=404, detail="Audio file not found")
    return FileResponse(path, media_type="audio/wav", filename="response.wav")


@app.post("/transcribe")
async def transcribe_audio(audio: UploadFile = File(...)) -> Dict[str, str]:
    if not agent:
        raise HTTPException(status_code=503, detail="Agent not initialized")
    try:
        with tempfile.NamedTemporaryFile(delete=False, suffix=".wav") as temp_audio:
            content = await audio.read()
            temp_audio.write(content)
            temp_audio_path = temp_audio.name
        transcribed_text = agent.process_audio_file(temp_audio_path)
        os.unlink(temp_audio_path)
        return {"success": True, "transcription": transcribed_text}
    except Exception as e:
        logger.error(f"Error transcribing audio: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/synthesize")
async def synthesize_speech(data: Dict[str, str]) -> Dict[str, str]:
    if not agent:
        raise HTTPException(status_code=503, detail="Agent not initialized")
    try:
        text = data.get("text")
        if not text:
            raise HTTPException(status_code=400, detail="Text field is required")
        output_path = tempfile.mktemp(suffix=".wav")
        audio_path = agent.text_to_speech(text, output_path)
        return {"success": True, "audio_url": f"/download-audio?path={audio_path}"}
    except Exception as e:
        logger.error(f"Error synthesizing speech: {e}")
        raise HTTPException(status_code=500, detail=str(e))
