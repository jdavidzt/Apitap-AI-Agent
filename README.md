# Apitap AI Voice Customer Service Agent 🎙️🤖

**Version: 2.0.0** | [Changelog](CHANGELOG.md)

AI-powered voice customer service agent for e-commerce, with voice input, intelligent query processing connected to MySQL database, and voice responses.

## 🎯 Features

- **Speech-to-Text (STT)**: Whisper base model with audio processing using numpy and wave
- **Natural Language Understanding (NLU)**: Llama 3.2/3.1 running locally via Ollama
- **Database**: Complete MySQL integration for e-commerce
- **Text-to-Speech (TTS)**: Coqui TTS (100% open source) with multilingual support (Spanish)
- **100% Open Source**: Whisper, Llama 3.1, Ollama, Coqui TTS and MySQL - no paid APIs
- **Fully Dockerized**: Simple deployment with Docker Compose

## 🖥️ Hardware Specifications

### 💻 Minimum Configuration (Current Setup)

This configuration is optimized for systems with limited RAM.

**System Requirements:**
- **RAM**: 4 GB minimum (3.8 GB available recommended)
- **Disk Space**: ~7 GB for AI models
- **CPU**: Dual-core processor or better
- **Network**: Internet connection for initial model download

**AI Models (Current):**
- **LLM**: Llama 3.2 1B (~1.3 GB)
  - Faster responses
  - Lower accuracy on complex queries
  - Good for basic product/order queries
- **STT**: Whisper base (~140 MB)
- **TTS**: Coqui TTS Spanish model (~100 MB)

**Expected Performance:**
- Response time: 5-10 seconds
- Accuracy: ~70-80% on entity extraction
- Best for: Simple queries, limited concurrent users

**Configuration in `.env`:**
```bash
OLLAMA_MODEL=llama3.2:1b
```

### 🚀 Recommended Configuration (Full-Featured)

This configuration provides optimal performance and accuracy.

**System Requirements:**
- **RAM**: 8 GB minimum (16 GB recommended)
- **Disk Space**: ~10 GB for AI models
- **CPU**: Quad-core processor or better
- **GPU**: Optional (NVIDIA with CUDA support for faster processing)

**AI Models (Recommended):**
- **LLM**: Llama 3.1 8B (~4.9 GB) or Llama 3.2 3B (~2.0 GB)
  - Higher accuracy
  - Better context understanding
  - More natural responses
- **STT**: Whisper base or small (~140-460 MB)
- **TTS**: Coqui TTS Spanish model (~100 MB)

**Expected Performance:**
- Response time: 8-15 seconds (CPU) or 3-5 seconds (GPU)
- Accuracy: ~90-95% on entity extraction
- Best for: Complex queries, multiple concurrent users, production environments

**Configuration in `.env`:**
```bash
# For Llama 3.1 8B (most accurate)
OLLAMA_MODEL=llama3.1:8b

# OR for Llama 3.2 3B (balanced)
OLLAMA_MODEL=llama3.2:3b
```

**Model Comparison Table:**

| Model | Size | RAM Required | Speed | Accuracy | Use Case |
|-------|------|--------------|-------|----------|----------|
| Llama 3.2 1B | 1.3 GB | 4 GB | Fast | Good | Limited resources, testing |
| Llama 3.2 3B | 2.0 GB | 6 GB | Medium | Very Good | Balanced performance |
| Llama 3.1 8B | 4.9 GB | 8 GB | Slower | Excellent | Production, best accuracy |
| Llama 3.1 70B | 40 GB | 64 GB+ | Slow | Outstanding | High-end servers only |

**Switching Models:**

To upgrade your model, edit `.env`:
```bash
OLLAMA_MODEL=llama3.1:8b  # or llama3.2:3b
```

Then rebuild:
```bash
docker-compose down
docker-compose up --build
```

The new model will be downloaded automatically on first run.

## 🏗️ Architecture

```
┌─────────────┐
│    User     │
│  (Audio In) │
└──────┬──────┘
       │
       ▼
┌─────────────────────────────────────┐
│     Voice Agent API (FastAPI)       │
├─────────────────────────────────────┤
│                                     │
│  1. Whisper STT                     │
│     ↓                               │
│  2. Llama 3.2/3.1 via Ollama (NLU)  │
│     ↓                               │
│  3. MySQL Database Query            │
│     ↓                               │
│  4. Llama 3.2/3.1 (Response Gen)    │
│     ↓                               │
│  5. Coqui TTS (Open Source)         │
│                                     │
└──────┬──────────────────────────────┘
       │
       ▼
┌─────────────┐
│    User     │
│ (Audio Out) │
└─────────────┘
```

## 📋 Prerequisites

- Docker and Docker Compose installed
- At least 4 GB RAM (8 GB recommended for Llama 3.1 8B)
- ~7-10 GB disk space (for AI models)
- **NO API keys required** - Everything runs locally

## 🚀 Installation and Setup

### 1. Clone the repository

```bash
git clone <repository-url>
cd Apitap-AI-Agent
```

### 2. Configure environment variables

```bash
cp .env.example .env
```

Edit the `.env` file with your credentials:

```bash
# Llama 3.2/3.1 Model (via Ollama - NO API KEY NEEDED!)
# Options:
#   - llama3.2:1b (1.3 GB, for limited resources)
#   - llama3.2:3b (2.0 GB, balanced)
#   - llama3.1:8b (4.9 GB, recommended for production)
OLLAMA_MODEL=llama3.2:1b

# Coqui TTS Model (optional, default "tts_models/es/css10/vits")
TTS_MODEL=tts_models/es/css10/vits

# MySQL Password (change this for security)
MYSQL_PASSWORD=your_secure_password
```

#### 🎉 No API Keys Needed!

This project is **100% open source** and runs completely locally:

**Llama 3.2/3.1 via Ollama (NLU):**
- ✅ **NO API key required**
- ✅ Runs 100% locally
- ✅ Total privacy - your data never leaves your machine
- ✅ No API costs
- ✅ Model downloads automatically on first use

**Available Llama Models:**
- **llama3.2:1b**: 1 billion parameters, ~1.3 GB (minimum resources)
- **llama3.2:3b**: 3 billion parameters, ~2.0 GB (balanced)
- **llama3.1:8b**: 8 billion parameters, ~4.9 GB (recommended for most cases)
- **llama3.1:70b**: 70 billion parameters, ~40 GB (highest quality, requires significant RAM)

**Coqui TTS (No API Key Required):**
- ✅ **NO API key required**
- ✅ 100% open source and local
- **tts_models/es/css10/vits**: Spanish model, good quality (recommended)
- **tts_models/multilingual/multi-dataset/your_tts**: Multilingual, supports Spanish
- Model downloads automatically on first run

### 3. Build and run with Docker

```bash
# Build and start services
docker-compose up --build

# Or run in background
docker-compose up -d --build
```

**Important note:** First run will automatically download:
- Whisper base model (~140 MB) - 1-2 minutes
- Llama 3.2 1B model (~1.3 GB) OR Llama 3.1 8B (~4.9 GB) - 5-30 minutes depending on your connection
- Coqui TTS model (~100 MB) - 1-2 minutes

Total: ~2-5 GB download. Please be patient on first startup!

### 4. Verify it's working

```bash
# Check API health
curl http://localhost:8001/health
```

Expected response:
```json
{
  "status": "healthy",
  "agent_initialized": true,
  "stt": "Whisper (Open Source)",
  "nlu": "Llama 3.1 via Ollama (Open Source)",
  "tts": "Coqui TTS (Open Source)"
}
```

## 💬 Web Chat Interface with Voice

The project includes a modern, easy-to-use web interface to interact with the voice assistant.

### 🚀 Quick Access

Simply open your browser and go to:

```
http://localhost:8001
```

### ✨ Interface Features

- 🎤 **Direct recording** from browser (click or press Space)
- 💬 **Real-time chat** with transcription of your messages
- 🔊 **Automatic playback** of audio responses
- 📱 **Responsive design** for mobile and desktop
- 🎨 **Modern interface** with Apitap branding (green theme)

### 📖 How to Use

1. Open http://localhost:8001 in your browser
2. Authorize microphone access (only first time)
3. Click the 🎤 button or press `Space` to start recording
4. Speak your query (e.g., "What is the status of my order 123?")
5. Click again to stop
6. Wait for the response in text and audio!

### 🎯 Example Queries

- "What is the status of my order 123?"
- "Do you have iPhone 15 Pro available?"
- "How much does product number 5 cost?"
- "Information about my last order"
- "What products do you have in stock?"

### 📱 Compatible Browsers

- ✅ Chrome/Chromium 60+
- ✅ Firefox 55+
- ✅ Safari 11+
- ✅ Edge 79+

## 📡 API Endpoints

### 1. **POST /process-voice** - Complete voice-to-voice pipeline

Processes audio input and returns audio response.

```bash
curl -X POST http://localhost:8001/process-voice \
  -F "audio=@/path/to/audio.wav"
```

Response:
```json
{
  "success": true,
  "transcription": "What is the status of my order 123?",
  "response_text": "Your order #123 is on its way...",
  "audio_url": "/download-audio?path=/tmp/response.wav"
}
```

### 2. **POST /transcribe** - Transcription only

Converts audio to text.

```bash
curl -X POST http://localhost:8001/transcribe \
  -F "audio=@/path/to/audio.wav"
```

### 3. **POST /text-query** - Text query

Processes a text query and returns response in text and audio.

```bash
curl -X POST http://localhost:8001/text-query \
  -H "Content-Type: application/json" \
  -d '{"text": "What is the status of my order 123?"}'
```

### 4. **POST /synthesize** - Speech synthesis only

Converts text to audio.

```bash
curl -X POST http://localhost:8001/synthesize \
  -H "Content-Type: application/json" \
  -d '{"text": "Hello, how can I help you today?"}'
```

### 5. **GET /download-audio** - Download generated audio

```bash
curl http://localhost:8001/download-audio?path=/tmp/response.wav \
  --output response.wav
```

## 🗄️ Database

The MySQL database initializes automatically with:

### Main tables:

- **customers**: Customer information
- **products**: Product catalog
- **orders**: Placed orders
- **order_items**: Order details

### Sample data:

- 5 customers
- 10 products (smartphones, laptops, accessories, etc.)
- 6 orders with different statuses

### Supported queries:

The agent can answer queries about:
- Order status
- Product information
- Purchase history
- Shipping tracking
- Stock availability

## 🛠️ Local Development

### Project structure

```
Apitap-AI-Agent/
├── src/
│   ├── api/
│   │   └── server.py          # FastAPI server
│   ├── services/
│   │   └── voice_agent.py     # Main agent logic
│   └── utils/
│       ├── audio_processor.py # Audio processing (numpy + wave)
│       └── database.py        # MySQL integration
├── static/
│   └── index.html            # Web chat interface
├── sql/
│   └── init.sql              # Database schema & sample data
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── .env.example
└── README.md
```

### Run without Docker (development)

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Make sure MySQL is running
# Configure .env with local MySQL credentials

# Run server
uvicorn src.api.server:app --reload --host 0.0.0.0 --port 8001
```

## 📊 Usage Example

### Scenario 1: Customer asks for order status

**Input (audio):** "Hello, I would like to know the status of my order number 123"

**Processing:**
1. Whisper transcribes the audio
2. Llama 3.2/3.1 (Ollama) identifies:
   - Intent: `order_status`
   - Entity: `order_id = 123`
3. MySQL is queried to get order information
4. Llama 3.2/3.1 generates contextual response
5. Coqui TTS synthesizes the response in audio

**Output (audio):** "Hello! Your order number 123 is on its way. It was shipped on January 10th and the tracking number is ES123456789. You should receive it in the next 2-3 business days."

### Scenario 2: Customer searches for product information

**Input:** "Do you have iPhone 15 Pro available and how much does it cost?"

**Response:** "Yes, we have the iPhone 15 Pro available. The price is $1199.99 and we currently have 50 units in stock."

## 🐛 Troubleshooting

### Error: "Agent not initialized"

- Verify that environment variables are configured correctly in `.env`
- Check the logs: `docker-compose logs voice-agent`

### Error: "Database connection failed"

- Wait for MySQL to be fully initialized (may take 30-60 seconds)
- Verify: `docker-compose logs mysql`

### Whisper error: Model download

- The first time it runs, Whisper downloads the model (~150 MB)
- This is normal and only happens once

### Audio not processing correctly

- Make sure to use WAV format
- Recommended sample rate: 16kHz
- Mono channel (1 channel)

### Low accuracy with Llama 3.2 1B

- Entity extraction may be inconsistent with smaller models
- Solution: Upgrade to `llama3.2:3b` or `llama3.1:8b` (see Hardware Specifications section)

## 🔧 Advanced Configuration

### Change Whisper model

In `src/services/voice_agent.py:28`:

```python
# Options: tiny, base, small, medium, large
self.whisper_model = whisper.load_model("base")
```

**Note:** Larger models are more accurate but require more memory.

### Change Llama model

You can change the model by editing `.env`:

```bash
OLLAMA_MODEL=llama3.1:8b  # For better accuracy (requires more RAM)
```

Available models:
- `llama3.2:1b`: 1B parameters, ~1.3 GB RAM, minimum
- `llama3.2:3b`: 3B parameters, ~2.0 GB RAM, balanced
- `llama3.1:8b`: 8B parameters, ~4.9 GB RAM, recommended
- `llama3.1:70b`: 70B parameters, ~40 GB RAM, highest quality
- You can also use other Ollama models: `mistral`, `codellama`, `phi3`, etc.

To download a new model:
```bash
docker exec -it ollama-llm ollama pull llama3.1:8b
```

### Change Coqui TTS model

Edit `.env` to use different voice models:

```bash
TTS_MODEL=tts_models/multilingual/multi-dataset/your_tts
```

### Modify NLU prompt

Edit `src/services/voice_agent.py` in the `understand_query` method to adjust how Llama interprets queries.

## 📝 Logs and Monitoring

```bash
# View logs in real-time
docker-compose logs -f

# View logs for specific service
docker-compose logs -f voice-agent
docker-compose logs -f mysql

# View last 100 lines
docker-compose logs --tail=100 voice-agent
```

## 🧪 Testing

### Manual test with curl

```bash
# 1. Record audio with your question (e.g., question.wav)

# 2. Send the query
curl -X POST http://localhost:8001/process-voice \
  -F "audio=@question.wav" \
  -o response.json

# 3. Download the audio response
# (Extract the path from response.json)
curl "http://localhost:8001/download-audio?path=/tmp/response.wav" \
  --output response.wav

# 4. Play the audio
# On Linux:
aplay response.wav
# On Mac:
afplay response.wav
```

## 🚀 Production Deployment

### Security considerations:

1. **Change default passwords:**
   ```bash
   MYSQL_PASSWORD=<unique-secure-password>
   ```

2. **Don't expose MySQL directly:**
   - Remove MySQL port mapping in `docker-compose.yml`

3. **Use HTTPS:**
   - Configure a reverse proxy (nginx, Traefik)
   - Get SSL certificates (Let's Encrypt)

4. **Secure environment variables:**
   - Use secrets management (AWS Secrets Manager, HashiCorp Vault)

5. **Rate limiting:**
   - Implement rate limiting in the API to prevent abuse

### Scalability:

- Consider using a managed database service (AWS RDS, Google Cloud SQL)
- Deploy multiple voice-agent instances behind a load balancer
- Use Redis for caching frequent responses

## 📄 License

This project is **100% Open Source** - no paid APIs required:

Main components and licenses:
- **Whisper**: MIT License (Open Source)
- **Llama 3.2/3.1**: Llama 3 Community License (Open Source)
- **Ollama**: MIT License (Open Source)
- **Coqui TTS**: MPL 2.0 License (Open Source)
- **FastAPI**: MIT License (Open Source)
- **MySQL**: GPL (Open Source)

**Everything runs locally - no dependencies on paid cloud services.**

## 🤝 Contributions

Contributions are welcome. Please:

1. Fork the project
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📧 Support

For questions or issues:
- Open an issue on GitHub
- Contact the development team

## 🎉 Credits

Built with 100% open source technology:
- [OpenAI Whisper](https://github.com/openai/whisper) (Open Source STT)
- [Llama 3.1](https://ai.meta.com/llama/) (Open Source LLM by Meta)
- [Llama 3.2](https://ai.meta.com/llama/) (Open Source LLM by Meta)
- [Ollama](https://ollama.ai/) (Local LLM server)
- [Coqui TTS](https://github.com/coqui-ai/TTS) (Open Source TTS)
- [FastAPI](https://fastapi.tiangolo.com/)
- [MySQL](https://www.mysql.com/)

---

**Enjoy building with the Voice Customer Service Agent! 🎙️✨**
