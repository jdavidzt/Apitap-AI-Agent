# CLAUDE.md - Apitap AI Agent Project Reference

## Project Overview

**Apitap AI Customer Service Agent** is a locally-run, AI-powered customer service system for e-commerce. It processes both **voice and text queries** end-to-end: speech-to-text, natural language understanding, database lookup, response generation, and text-to-speech — all using 100% open-source models with NO paid APIs. Optimized for **Mac Mini M4** (Apple Silicon).

**Current Version:** 3.0.0

## Tech Stack

- **Language:** Python 3.10+
- **Web Framework:** FastAPI 0.109.0 + Uvicorn 0.27.0
- **STT (Speech-to-Text):** OpenAI Whisper (`tiny` model, ~75 MB)
- **LLM (NLU + Response):** Llama 3.2 1B via Ollama (local, no API key)
- **TTS (Text-to-Speech):** Coqui TTS 0.22.0 (Spanish: `tts_models/es/css10/vits`)
- **Database:** MySQL (Homebrew)
- **Audio Processing:** NumPy, Wave, PyTorch (MPS/Metal acceleration on M4)
- **Frontend:** Vanilla HTML/JS with voice + text dual input

## Project Structure

```
Apitap-AI-Agent/
├── src/
│   ├── api/
│   │   └── server.py              # FastAPI application (main entry point)
│   ├── services/
│   │   └── voice_agent.py         # Core agent: Whisper + Ollama + Coqui TTS
│   └── utils/
│       ├── audio_processor.py     # Audio format handling (WAV, resampling)
│       └── database.py            # MySQL multi-DB connection and queries
├── static/
│   └── index.html                 # Web UI: mic button + text input field
├── sql/
│   ├── init.sql                   # Demo e-commerce (4 tables + sample data)
│   ├── load_platform.sh           # Loads full DBITEMS + DBCARDS databases
│   └── [335+ SQL files]           # Full platform: 5 databases, 311 tables
├── scripts/
│   ├── setup-mac.sh               # One-time Mac setup (Homebrew, venv, models)
│   └── start-local.sh             # Daily startup (MySQL, Ollama, FastAPI)
├── requirements.txt               # Python dependencies
├── .env.example                   # Environment variable template
├── VERSION                        # Semantic version (3.0.0)
├── CLAUDE.md                      # This file
└── README.md                      # User documentation
```

## Quick Start (Mac Mini M4)

```bash
# One-time setup
bash scripts/setup-mac.sh

# Daily startup
bash scripts/start-local.sh

# Open browser
open http://localhost:8000
```

### Prerequisites
- **Homebrew** (`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`)
- **Python 3.10+** (`brew install python@3.10`)

### What `setup-mac.sh` Does
1. Installs MySQL, Ollama, FFmpeg via Homebrew
2. Starts MySQL, creates `ecommerce` database
3. Loads demo data (`sql/init.sql`) and platform databases
4. Creates Python venv + installs dependencies
5. Starts Ollama and pulls `llama3.2:1b` model

### What `start-local.sh` Does
1. Ensures MySQL is running (`brew services start mysql`)
2. Ensures Ollama is running (`ollama serve`)
3. Starts FastAPI server with `--reload`

## Key Files

### `src/api/server.py`
FastAPI application (v3.0.0). Serves web UI, initializes `VoiceCustomerServiceAgent` on startup. CORS enabled. Endpoints handle both voice and text input.

### `src/services/voice_agent.py`
Core `VoiceCustomerServiceAgent` class:
- `process_audio_file()` / `process_audio_bytes()` — Whisper STT
- `understand_query(text)` — Ollama NLU (extracts intent + entities as JSON)
- `fetch_database_info(understanding)` — MySQL query dispatcher
- `generate_response(understanding, db_data)` — Ollama response generation
- `text_to_speech(text, path)` — Coqui TTS → WAV
- `process_voice_query(audio, path)` — Full end-to-end pipeline

**Defaults:** Whisper `tiny`, Ollama `http://localhost:11434`, model `llama3.2:1b`

### `src/utils/database.py`
`DatabaseManager` with multi-database support (no database lock in connection):
- **E-Commerce (dbitems):** `get_order_status()`, `get_order_by_number()`, `get_product_info()`, `search_products()`, `get_customer_orders()`
- **Payments (dbcards):** `get_card_info()`, `get_cards_by_user()`, `get_card_types()`, `get_payment_providers()`
- **Fallback (ecommerce):** All e-commerce queries fall back to demo DB if `dbitems` not loaded
- `get_table_info()` returns curated `PLATFORM_SCHEMA` constant for LLM context
- `_has_database(name)` checks if a database exists before querying

### `src/utils/audio_processor.py`
Audio format handling: load/save WAV, resampling to 16kHz, normalization, stereo-to-mono, silence trimming.

### `static/index.html`
Web UI (v4.0) with dual input:
- **Text input:** Type question + press Enter or click send button
- **Voice input:** Click mic button or press Space bar
- Chat history with auto-scroll, audio auto-playback
- Apitap green theme (#7BA428)

## API Endpoints

| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/` | Web UI (serves `static/index.html`) |
| `GET` | `/health` | Health check |
| `POST` | `/process-voice` | Voice pipeline: audio → text → response → audio |
| `POST` | `/transcribe` | Audio to text only (Whisper) |
| `POST` | `/text-query` | Text → NLU → DB → response → audio |
| `POST` | `/synthesize` | Text to speech only |
| `GET` | `/download-audio` | Download generated WAV file |

## Voice + Text Processing Pipeline

```
Input: Voice (mic) OR Text (keyboard)
    │
    ▼
1. [Voice only] Whisper STT ── Audio → Text
    │
    ▼
2. Llama NLU (Ollama) ──────── Extract intent + entities (JSON)
    │                           Intents: order_status, product_info,
    │                           product_search, customer_info,
    │                           payment_info, card_status, general_inquiry
    ▼
3. MySQL Query ─────────────── Fetch data (dbitems/dbcards/ecommerce)
    │
    ▼
4. Llama Response Gen ──────── Generate conversational response (2-3 sentences)
    │
    ▼
5. Coqui TTS ──────────────── Text → Spanish WAV audio
    │
    ▼
Output: Text response + Audio playback
```

## Environment Variables

```bash
MYSQL_HOST=127.0.0.1           # Homebrew MySQL (localhost)
MYSQL_PORT=3306
MYSQL_DATABASE=ecommerce
MYSQL_USER=root
MYSQL_PASSWORD=                 # Empty for default Homebrew MySQL

OLLAMA_HOST=http://localhost:11434
OLLAMA_MODEL=llama3.2:1b       # Lightest model for M4
WHISPER_MODEL=tiny             # Options: tiny, base, small

TTS_MODEL=tts_models/es/css10/vits
API_PORT=8000
LOG_LEVEL=INFO
```

## AI Models (Mac Mini M4 Optimized)

| Component | Model | Size | Notes |
|-----------|-------|------|-------|
| Whisper STT | `tiny` | ~75 MB | Fastest. Use `base` (~140MB) for better accuracy |
| Ollama LLM | `llama3.2:1b` | ~1.3 GB | Fast on M4. Use `3b` or `8b` for better quality |
| Coqui TTS | `es/css10/vits` | ~100 MB | Spanish VITS. Only Spanish model option |

**Total disk:** ~1.5 GB for all models

## Database Schema

### Multi-Database Architecture
The agent connects to MySQL without locking to a single database, enabling cross-database queries (`dbitems.tbl_product`, `dbcards.tbl_card`).

### Demo Database (`init.sql`)
4 simplified tables: `customers`, `products`, `orders`, `order_items` with sample data.

### Platform Databases (loaded by `sql/load_platform.sh`)

**DBITEMS** (154 tables) — E-Commerce: products, categories, orders, shopping carts, advertising, coupons
**DBCARDS** (21 tables) — Payments: cards, card types/status, payment providers, user-card associations

Key tables used by the agent:
- `dbitems.tbl_product` — Products (name, prices, quantity, brand, SKU)
- `dbitems.tbl_order` + `tbl_orderstatus` — Orders (statuses: Open/Done/Close/Cancel)
- `dbitems.tbl_orderdetail` — Order line items
- `dbcards.tbl_card` + `tbl_cardstype` + `tbl_cardstatus` — Cards (VISA/MC/AMEX, Active/Inactive)
- `dbcards.tbl_carduser` — User-to-card associations
- `dbcards.tbl_paymentserviceprovider` — Payment providers

### SQL File Naming
- Table files: `{database}_tbl_{tablename}.sql`
- Routine files: `{database}_routines.sql`

## Supported Query Types

- **Order status:** "What's the status of order 123?" / "Track order ORD-5678"
- **Product info:** "How much is product 5?" / "Do you have iPhone 15 Pro?"
- **Product search:** "Show me laptops" / "What electronics are in stock?"
- **Customer orders:** "Show orders for customer 3"
- **Payment info:** "What payment methods do you accept?" / "Do you accept Visa?"
- **Card status:** "What cards does user 10 have?" / "Show me card 42"

## Testing

```bash
# Health check
curl http://localhost:8000/health

# Text query
curl -X POST http://localhost:8000/text-query \
  -H "Content-Type: application/json" \
  -d '{"text": "What is the status of order 1?"}'

# Payment query
curl -X POST http://localhost:8000/text-query \
  -H "Content-Type: application/json" \
  -d '{"text": "Do you accept Visa?"}'

# Voice processing
curl -X POST http://localhost:8000/process-voice \
  -F "audio=@question.wav"
```

## Security Notes

- No authentication (designed for local use)
- No rate limiting
- CORS open to all origins
- MySQL credentials via environment variables

## Version History

- **v3.0.0** (2026-02-10) — Local Mac M4 setup, removed Docker, text input, Whisper tiny, llama3.2:1b defaults
- **v2.0.0** (2026-02-02) — Docker Compose + RunPod deployment, platform DB support
- **v1.0.0** (2026-02-01) — Initial release with Spanish interface, full voice pipeline
