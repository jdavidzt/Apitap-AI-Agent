"""
FastAPI server for Voice Customer Service Agent
"""

from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.responses import FileResponse
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
import logging
import os
import tempfile
from typing import Dict, Any

from src.services.voice_agent import VoiceCustomerServiceAgent

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = FastAPI(
    title="Voice Customer Service Agent API",
    description="AI-powered voice customer service for e-commerce",
    version="3.0.0"
)

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Mount static files
static_path = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(__file__))), "static")
if os.path.exists(static_path):
    app.mount("/static", StaticFiles(directory=static_path), name="static")

# Initialize the voice agent
agent = None


@app.on_event("startup")
async def startup_event():
    """Initialize the voice agent on startup"""
    global agent
    logger.info("Starting Voice Customer Service Agent...")
    try:
        agent = VoiceCustomerServiceAgent()
        logger.info("Voice agent initialized successfully")
    except Exception as e:
        logger.error(f"Failed to initialize voice agent: {e}")
        raise


@app.on_event("shutdown")
async def shutdown_event():
    """Cleanup on shutdown"""
    global agent
    if agent:
        agent.cleanup()
    logger.info("Voice agent shut down")


@app.get("/")
async def root():
    """Root endpoint - serve the chat interface"""
    static_path = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(__file__))), "static")
    index_path = os.path.join(static_path, "index.html")

    if os.path.exists(index_path):
        return FileResponse(index_path)

    return {
        "message": "Voice Customer Service Agent API",
        "version": "3.0.0",
        "status": "running"
    }

@app.get("/api")
async def api_info():
    """API info endpoint"""
    return {
        "message": "Voice Customer Service Agent API",
        "version": "3.0.0",
        "status": "running"
    }


@app.get("/health")
async def health_check():
    """Health check endpoint"""
    return {
        "status": "healthy",
        "agent_initialized": agent is not None,
        "stt": "Whisper tiny (Open Source)",
        "nlu": "Llama 3.2 1B via Ollama (Open Source)",
        "tts": "Coqui TTS (Open Source)"
    }


@app.post("/process-voice")
async def process_voice(audio: UploadFile = File(...)) -> Dict[str, Any]:
    """
    Process voice input and return voice response

    Args:
        audio: Audio file (WAV format recommended)

    Returns:
        JSON with transcription, response text, and audio file path
    """
    if not agent:
        raise HTTPException(status_code=503, detail="Agent not initialized")

    try:
        # Save uploaded file temporarily
        with tempfile.NamedTemporaryFile(delete=False, suffix=".wav") as temp_audio:
            content = await audio.read()
            temp_audio.write(content)
            temp_audio_path = temp_audio.name

        # First transcribe the audio
        transcription = agent.process_audio_file(temp_audio_path)

        # Create output path for response audio
        output_path = tempfile.mktemp(suffix=".wav")

        # Process the voice query
        response_text, audio_path = agent.process_voice_query(
            temp_audio_path,
            output_path
        )

        # Clean up input file
        os.unlink(temp_audio_path)

        return {
            "success": True,
            "transcription": transcription,
            "response_text": response_text,
            "audio_url": f"/download-audio?path={audio_path}"
        }

    except Exception as e:
        logger.error(f"Error processing voice: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/transcribe")
async def transcribe_audio(audio: UploadFile = File(...)) -> Dict[str, str]:
    """
    Transcribe audio to text only

    Args:
        audio: Audio file

    Returns:
        JSON with transcribed text
    """
    if not agent:
        raise HTTPException(status_code=503, detail="Agent not initialized")

    try:
        # Save uploaded file temporarily
        with tempfile.NamedTemporaryFile(delete=False, suffix=".wav") as temp_audio:
            content = await audio.read()
            temp_audio.write(content)
            temp_audio_path = temp_audio.name

        # Transcribe
        transcribed_text = agent.process_audio_file(temp_audio_path)

        # Clean up
        os.unlink(temp_audio_path)

        return {
            "success": True,
            "transcription": transcribed_text
        }

    except Exception as e:
        logger.error(f"Error transcribing audio: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/text-query")
async def text_query(query: Dict[str, str]) -> Dict[str, Any]:
    """
    Process text query and return text and voice response

    Args:
        query: JSON with "text" field

    Returns:
        JSON with response and audio URL
    """
    if not agent:
        raise HTTPException(status_code=503, detail="Agent not initialized")

    try:
        text = query.get("text")
        if not text:
            raise HTTPException(status_code=400, detail="Text field is required")

        # Understand query
        understanding = agent.understand_query(text)

        # Fetch database info
        db_data = agent.fetch_database_info(understanding)

        # Generate response
        response_text = agent.generate_response(understanding, db_data)

        # Convert to speech
        output_path = tempfile.mktemp(suffix=".wav")
        audio_path = agent.text_to_speech(response_text, output_path)

        return {
            "success": True,
            "response_text": response_text,
            "understanding": understanding,
            "database_data": db_data,
            "audio_url": f"/download-audio?path={audio_path}"
        }

    except Exception as e:
        logger.error(f"Error processing text query: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/download-audio")
async def download_audio(path: str):
    """
    Download generated audio file

    Args:
        path: Path to audio file

    Returns:
        Audio file
    """
    if not os.path.exists(path):
        raise HTTPException(status_code=404, detail="Audio file not found")

    return FileResponse(
        path,
        media_type="audio/wav",
        filename="response.wav"
    )


@app.post("/synthesize")
async def synthesize_speech(data: Dict[str, str]) -> Dict[str, str]:
    """
    Convert text to speech

    Args:
        data: JSON with "text" field

    Returns:
        JSON with audio URL
    """
    if not agent:
        raise HTTPException(status_code=503, detail="Agent not initialized")

    try:
        text = data.get("text")
        if not text:
            raise HTTPException(status_code=400, detail="Text field is required")

        # Convert to speech
        output_path = tempfile.mktemp(suffix=".wav")
        audio_path = agent.text_to_speech(text, output_path)

        return {
            "success": True,
            "audio_url": f"/download-audio?path={audio_path}"
        }

    except Exception as e:
        logger.error(f"Error synthesizing speech: {e}")
        raise HTTPException(status_code=500, detail=str(e))


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(
        "server:app",
        host="0.0.0.0",
        port=8000,
        reload=True
    )
