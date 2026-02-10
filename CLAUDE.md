# CLAUDE.md - Apitap AI Agent Project Reference

## Project Overview

**Apitap AI Voice Customer Service Agent** is a fully containerized, AI-powered voice customer service system for e-commerce. It processes voice queries end-to-end: speech-to-text, natural language understanding, database lookup, response generation, and text-to-speech — all using 100% open-source models with NO paid APIs.

**Current Version:** 2.0.0

## Tech Stack

- **Language:** Python 3.10
- **Web Framework:** FastAPI 0.109.0 + Uvicorn 0.27.0
- **STT (Speech-to-Text):** OpenAI Whisper (base model, ~140 MB)
- **LLM (NLU + Response):** Llama 3.2/3.1 via Ollama (local, no API key)
- **TTS (Text-to-Speech):** Coqui TTS 0.22.0 (Spanish: `tts_models/es/css10/vits`)
- **Database:** MySQL 8.0
- **Audio Processing:** NumPy, Wave, Torch, Torchaudio
- **Containerization:** Docker + Docker Compose
- **Frontend:** Vanilla HTML/JS (single-file web chat)

## Project Structure

```
Apitap-AI-Agent/
├── src/
│   ├── api/
│   │   └── server.py              # FastAPI application (main entry point)
│   ├── services/
│   │   └── voice_agent.py         # Core agent: Whisper + Ollama + Coqui TTS
│   └── utils/
│       ├── audio_processor.py     # Audio format handling (WAV, resampling, normalization)
│       └── database.py            # MySQL connection pooling and queries
├── static/
│   └── index.html                 # Web chat interface (mic recording, auto-playback)
├── sql/
│   ├── init.sql                   # Demo e-commerce subset (4 tables + sample data)
│   └── [335+ SQL files]           # Full platform schema: 5 databases, 311 tables
├── scripts/
│   └── init-ollama.sh             # Ollama model download on startup
├── Dockerfile                     # Python 3.10-slim + ffmpeg + Rust (for Coqui)
├── docker-compose.yml             # 4 services: ollama, ollama-init, mysql, voice-agent
├── requirements.txt               # Python dependencies
├── .env.example                   # Environment variable template
├── VERSION                        # Semantic version (2.0.0)
├── README.md                      # Full documentation
└── CHANGELOG.md                   # Release history
```

## Key Files

### `src/api/server.py`
FastAPI application and main entry point. Serves the web interface, initializes the `VoiceCustomerServiceAgent` on startup, and exposes all REST endpoints. CORS enabled for all origins.

### `src/services/voice_agent.py`
Core class `VoiceCustomerServiceAgent` with the full voice pipeline:
- `process_audio_file(audio_path)` — Transcribe audio via Whisper
- `process_audio_bytes(audio_bytes)` — Convert raw audio bytes to text
- `understand_query(user_text)` — NLU via Ollama (extracts intent, entities, query_type)
- `fetch_database_info(understanding)` — Query MySQL based on extracted intent/entities
- `generate_response(understanding, db_data)` — Generate conversational response via Ollama
- `text_to_speech(text, output_path)` — Convert text to WAV via Coqui TTS
- `process_voice_query(audio_input, output_path)` — Complete end-to-end pipeline
- `cleanup()` — Resource cleanup on shutdown

### `src/utils/database.py`
`DatabaseManager` class with MySQL connection pooling. Key methods:
- `get_order_status(order_id)` — Order details with items
- `get_product_info(product_id/name)` — Product lookup (ID or LIKE search)
- `get_customer_orders(customer_id, limit)` — Recent orders (default limit 10)
- `get_customer_by_email(email)` — Customer lookup
- `search_products(search_term, limit)` — Full-text product search
- `get_order_tracking(tracking_number)` — Track by tracking number
- `execute_custom_query(query, params)` — Generic SELECT queries (no writes)

Auto-reconnects on connection loss. Uses UTF-8MB4 charset for Spanish text.

### `src/utils/audio_processor.py`
`AudioProcessor` class for audio format handling:
- Load/save WAV files, bytes-to-array conversion
- Resampling (linear interpolation), normalization ([-1, 1])
- Silence trimming, duration calculation
- Supports 8-bit, 16-bit, 32-bit audio; stereo-to-mono conversion

### `static/index.html`
Self-contained web chat interface (~21 KB). Features: mic recording (click or Space key), chat history, real-time transcription display, auto-playback of responses. Apitap green branding (#7BA428). Works on Chrome, Firefox, Safari, Edge.

### `sql/init.sql`
Demo e-commerce database with 4 simplified tables (customers, products, orders, order_items) and sample data. Auto-loaded by MySQL container on first startup via `docker-entrypoint-initdb.d`. This is a testing subset — the full platform schema is in the remaining 335+ SQL files (see Database Schema section below).

### `scripts/init-ollama.sh`
Waits for Ollama service health, pulls the configured Llama model via API, verifies availability. Runs automatically during Docker Compose startup.

## API Endpoints

| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/` | Web chat interface (serves `static/index.html`) |
| `GET` | `/health` | Health check (status, components, agent state) |
| `GET` | `/api` | API metadata and status |
| `POST` | `/process-voice` | Full voice pipeline: audio in → transcription + response + audio out |
| `POST` | `/transcribe` | Audio to text only (Whisper) |
| `POST` | `/text-query` | Text query → understanding + DB data + response + audio |
| `POST` | `/synthesize` | Text to speech only (Coqui TTS) |
| `GET` | `/download-audio` | Download generated audio file (query param: `path`) |

## Voice Processing Pipeline

```
User Audio Input
    │
    ▼
1. Whisper STT ──────────── Audio → Text transcription
    │
    ▼
2. Llama NLU (Ollama) ───── Extract intent, entities, query_type
    │                        Intents: order_status, product_info,
    │                                 customer_info, general_inquiry
    ▼
3. MySQL Query ──────────── Fetch data based on intent/entities
    │
    ▼
4. Llama Response Gen ───── Generate conversational response (2-3 sentences)
    │
    ▼
5. Coqui TTS ───────────── Text → Spanish WAV audio
    │
    ▼
User Audio Response
```

## Database Schema

The full platform consists of **5 databases**, **311 tables**, **31 views**, and **~225 foreign keys**. The `sql/` directory contains one file per table (`{db}_tbl_{name}.sql`) plus routine files (`*_routines.sql`) for views/procedures.

### Demo Database (`init.sql`)

Used by the voice agent for testing. 4 simplified tables with sample data:

| Table | Key Columns |
|-------|-------------|
| `customers` | customer_id (PK), name, email (UNIQUE), phone, address |
| `products` | product_id (PK), name, price (DECIMAL 10,2), stock_quantity, category, brand, is_available |
| `orders` | order_id (PK), customer_id (FK), status (ENUM: pending/processing/shipped/delivered/cancelled), total_amount, tracking_number |
| `order_items` | order_item_id (PK), order_id (FK, CASCADE), product_id (FK), quantity, price |

Sample data: 5 customers, 10 products (electronics), 6 orders.

---

### Full Platform Schema (335+ SQL files)

#### 1. DBCARDS — Payment Cards & Financial Accounts (21 tables)

Card tokenization, multi-payment provider support (Visa, Mastercard, Amex, PayPal, bank accounts), ISO 8583 standard.

| Core Tables | Description |
|-------------|-------------|
| `tbl_card` (23 cols) | Main card storage: token, number, expiry, CVV, linked accounts |
| `tbl_card_log` (9 cols) | Audit log for all card operations |
| `tbl_carduser` (7 cols) | User-to-card associations |
| `tbl_cardstatus` | Card status lookup (Active/Inactive) |
| `tbl_cardstype` (4 cols) | Card type lookup (VISA, MASTERCARD, AMEX, etc.) |
| `tbl_cardpaypal` (7 cols) | PayPal-specific card data |

| Payment Provider Tables | Description |
|--------------------------|-------------|
| `tbl_paymentserviceprovider` (6 cols) | Payment processor details |
| `tbl_paymentserviceaccount` (8 cols) | Provider accounts per user |
| `tbl_paymentserviceprovider_unsupported` (8 cols) | Unsupported processors |
| `tbl_paymentserviceprovidertype` | Provider type lookup |
| `tbl_paymentnaturetype` | Payment nature lookup |
| `tbl_paymenttype` | Payment type lookup |

| Other Tables | Description |
|--------------|-------------|
| `tbl_accounttype` | Account types (Personal, Business, Corporate) |
| `tbl_bankaccounttype` | Bank account types (Savings, Checking) |
| `tbl_debitaccounttype` | Debit account types |
| `tbl_cardtypeaccepted` | Accepted card types per user |
| `tbl_cardtypeaccepted_account` (8 cols) | Acceptance per account |
| `tbl_data_elements` (9 cols) | ISO 8583 data elements |
| `tbl_driverlicense` | Driver license storage |
| `tbl_securityquestions` | Security question templates |
| `tbl_securityquestionsanswer` (4 cols) | User answers |

**Key FKs:** `tbl_card` → accounttype, bankaccounttype, cardstatus, cardstype, debitaccounttype. `tbl_paymentserviceaccount` → paymentserviceprovider.

---

#### 2. DBCOMMISSION — Sales Commission Management (6 tables)

| Table | Description |
|-------|-------------|
| `tbl_commission` (5 cols) | Commission records |
| `tbl_commission_detail` (5 cols) | Line items per commission |
| `tbl_commission_status` (3 cols) | Status lookup |
| `tbl_commission_rates` (18 cols) | Rate configurations |
| `tbl_commission_agent_file` (6 cols) | Agent file records |
| `tbl_commission_agent_file_bill` | Bill references |

**Views:** `vw_agent_list`, `vw_client_list`

---

#### 3. DBITEMS — E-Commerce & Inventory (154 tables, largest database)

**Products & Categories (~15 tables)**

| Table | Description |
|-------|-------------|
| `tbl_product` | Main product table |
| `tbl_category` (15 cols) | Categories with tax/return info |
| `tbl_categorydescription` | Multi-language category descriptions |
| `tbl_subcategory` | Product subcategories |
| `tbl_catalog` | Product catalogs/collections |
| `tbl_catalogproduct` | Product-to-catalog associations |
| `tbl_condition` / `tbl_conditiontype` | Product condition types |

**Orders & Transactions (~10 tables)**

| Table | Description |
|-------|-------------|
| `tbl_order` (97 cols) | Customer orders (full schema) |
| `tbl_orderdetail` (76 cols) | Order line items |
| `tbl_shoppingcart` | Shopping cart data |
| `tbl_shoppingcartdetail` (75 cols) | Cart items |
| `tbl_orderhistory` | Historical order data |
| `tbl_orderreturn` | Return requests |
| `tbl_orderstatus` / `tbl_ordertype` | Status and type lookups |
| `tbl_orderpayment` | Order payment records |

**Advertising & Marketing (~25 tables)**

| Table | Description |
|-------|-------------|
| `tbl_advertising` (12 cols) | Main advertising records |
| `tbl_advertisingimage` (6 cols) | Ad images |
| `tbl_advertising_favorite` / `_watched` | User engagement tracking |
| `tbl_advertisingrecommended` | Recommended ad-product pairs |
| `tbl_advertisingreport` | Ad performance reports |
| `tbl_campaign` (13 cols) | Marketing campaigns |
| `tbl_campaign_layout` / `_channel` / `_status` | Campaign configuration |
| `tbl_advertising_banner_type` | Banner type lookup |

**Coupons & Discounts (~10 tables)**

| Table | Description |
|-------|-------------|
| `tbl_coupon` | Coupon definitions |
| `tbl_clippedcoupon` (9 cols) | User clipped coupons |
| `tbl_discount` / `tbl_discounttype` | Discount records and types |
| `tbl_membership` | Membership plans |
| `tbl_clippedmembership` (10 cols) | User memberships |

**Services & Subscriptions (~15 tables)**

| Table | Description |
|-------|-------------|
| `tbl_services_task` (73 cols) | Service tasks |
| `tbl_subscription` | Subscriptions |
| `tbl_package` | Service packages |
| `tbl_package_results` (72 cols) | Package execution results |
| `tbl_service_type` | Service type lookup |

**Inventory & Assets (~15 tables)**

| Table | Description |
|-------|-------------|
| `tbl_asset` | Asset tracking |
| `tbl_asset_image` (13 cols) | Asset images |
| `tbl_inventory` / `tbl_inventory_status` | Inventory records |
| `tbl_location_inventory` | Location-based inventory |
| `tbl_barcodetype` | Barcode format types |
| `tbl_mobile_report` (70 cols) | Mobile app reports |

**Key Views (27 total):** `vw_active_product`, `vw_active_catalog`, `vw_active_service`, `vw_advertising`, `vw_advertising_favorite`, `vw_categories_with_parents`, `vw_category_levels`, `vw_categorytree`, `vw_order_summary`, `vw_item_schedule_active`

**105 foreign keys** connecting products, orders, categories, campaigns.

---

#### 4. DBUSER — User Management & CRM (119 tables)

**User Profiles (~25 tables)**

| Table | Description |
|-------|-------------|
| `tbl_user` | Main user profile |
| `tbl_consumer` | Consumer-specific data |
| `tbl_merchant` (108 cols) | Merchant/seller profile |
| `tbl_reseller` (70 cols) | Reseller profile |
| `tbl_user_type` / `tbl_user_status` | Type and status lookups |
| `tbl_email` (5 cols) | Email records |
| `tbl_phone` | Phone records |
| `tbl_rating_user` (69 cols) | User ratings |

**Locations & Addresses (~20 tables)**

| Table | Description |
|-------|-------------|
| `tbl_location` (11 cols) | Business locations |
| `tbl_mall_address` (72 cols) | Mall/venue addresses |
| `tbl_location_hardware` (67 cols) | Hardware per location |
| `tbl_favorite_location` | User favorite locations |
| `tbl_address` | General addresses |
| `tbl_city`, `tbl_state`, `tbl_country` | Geographic data |
| `tbl_timezone` | Timezone data |

**Devices & Hardware (~20 tables)**

| Table | Description |
|-------|-------------|
| `tbl_device` (9 cols) | Mobile/hardware devices |
| `tbl_device_os` | Device OS types |
| `tbl_devicetype` / `tbl_devicestatus` | Type and status |
| `tbl_deviceblock` (5 cols) | Blocked devices |
| `tbl_hardware_type` (9 cols) | Hardware types |
| `tbl_hardware_cart` (9 cols) | Hardware shipments |

**Support & Help (~20 tables)**

| Table | Description |
|-------|-------------|
| `tbl_help_ticket` (24 cols) | Support tickets |
| `tbl_help_ticket_type` / `_status` / `_reason` | Ticket lookups |
| `tbl_help_ticket_image` | Ticket attachments |
| `tbl_help_ticket_abuse` (7 cols) | Abuse reports |
| `tbl_help_faq`, `tbl_help_guide`, `tbl_help_video` | Help content |
| `tbl_crm_note` (18 cols) | CRM notes |

**Business & Company (~15 tables)**

| Table | Description |
|-------|-------------|
| `tbl_company` / `tbl_company_type` | Company records |
| `tbl_department` | Department records |
| `tbl_full_time_employees` | FTE tracking |
| `tbl_merchant_payfactory` (71 cols) | PayFactory merchant setup |

**Internationalization (~15 tables)**

| Table | Description |
|-------|-------------|
| `tbl_language` (6 cols) | Supported languages |
| `tbl_language_platform` | Language per platform |
| `tbl_languagelabel` | Localized labels |
| `tbl_platform` | Platform types |

**104 foreign keys** connecting users to locations, devices, tickets.

---

#### 5. NMC — Reporting & Audit (11 tables)

| Table | Description |
|-------|-------------|
| `tbl_access` (5 cols) | Access control records |
| `tbl_log` (13 cols) | Transaction/operation logs |
| `tbl_transactionkey` (5 cols) | Transaction key tracking |
| `tbl_t_error_control_aio` (6 cols) | Error logging |
| `tbl_client_type` (4 cols) | Client type lookup |
| `tbl_p_codes_sequence_aio` | Payment code sequences |
| `tbl_report` (7 cols) | Report definitions |
| `tbl_report_query` (7 cols) | Report queries |
| `tbl_report_field` (9 cols) | Report field definitions |
| `tbl_report_query_field` / `tbl_report_report_query` | Field and query mappings |

**Views:** `vw_login_count`, `vw_register_count`

---

### Cross-Database Relationships

- `tbl_user` (DBUSER) → Referenced by all other databases
- `tbl_card` (DBCARDS) ← Payment systems link here
- `tbl_product` (DBITEMS) → Used in orders, commissions, advertising
- `tbl_location` (DBUSER) → Referenced by inventory, hardware, orders
- `tbl_order` (DBITEMS) → Central to the processing pipeline

### SQL File Naming Convention

- Table files: `{database}_tbl_{tablename}.sql` (one per table)
- Routine files: `{database}_routines.sql` (views, procedures, functions)
- Demo file: `init.sql` (simplified subset for voice agent testing)

## Docker Architecture

4 services orchestrated via `docker-compose.yml`:

| Service | Image | Port | Purpose |
|---------|-------|------|---------|
| `ollama` | `ollama/ollama:latest` | 11434 | Local LLM server |
| `ollama-init` | (same) | — | Downloads Llama model on startup, then exits |
| `mysql` | `mysql:8.0` | 3307→3306 | E-commerce database |
| `voice-agent` | Built from Dockerfile | 8000 | FastAPI application |

**Volumes:** `ollama_data` (model cache), `mysql_data` (DB persistence), `audio_cache` (temp audio files)
**Network:** `voice-agent-network` (bridge)

## Environment Variables

```bash
# Database
MYSQL_HOST=mysql
MYSQL_PORT=3306
MYSQL_DATABASE=ecommerce
MYSQL_USER=root
MYSQL_PASSWORD=your_secure_mysql_password

# LLM (no API key needed)
OLLAMA_MODEL=llama3.2:1b    # Options: llama3.2:1b, llama3.2:3b, llama3.1:8b, llama3.1:70b
OLLAMA_HOST=http://ollama:11434

# Text-to-Speech
TTS_MODEL=tts_models/es/css10/vits    # Spanish model

# Application
API_PORT=8000
LOG_LEVEL=INFO
```

## AI Model Options

| Model | Size | RAM | Speed | Accuracy | Use Case |
|-------|------|-----|-------|----------|----------|
| Llama 3.2 1B | 1.3 GB | 4 GB | Fast | Good (~70-80%) | Testing, limited resources |
| Llama 3.2 3B | 2.0 GB | 6 GB | Medium | Very Good | Balanced |
| Llama 3.1 8B | 4.9 GB | 8 GB | Slower | Excellent (~90-95%) | Production (recommended) |
| Llama 3.1 70B | 40 GB | 64 GB+ | Slow | Outstanding | High-end servers only |

**Whisper:** base model (~140 MB). Options: tiny, small, medium, large
**Coqui TTS:** Spanish VITS (~100 MB). No API key required.

## Development

### Quick Start
```bash
cp .env.example .env
# Edit .env with your MySQL password and preferred Llama model
docker-compose up --build
# Access at http://localhost:8000
```

First run downloads models (~5-30 min depending on model size and connection).

### Health Check
```bash
curl http://localhost:8000/health
```

### Testing Endpoints
```bash
# Text query
curl -X POST http://localhost:8000/text-query \
  -H "Content-Type: application/json" \
  -d '{"text": "What is the status of order 1?"}'

# Voice processing
curl -X POST http://localhost:8000/process-voice \
  -F "audio=@question.wav"

# Text-to-speech
curl -X POST http://localhost:8000/synthesize \
  -H "Content-Type: application/json" \
  -d '{"text": "Hello, how can I help you?"}'
```

### Logs
```bash
docker-compose logs -f              # All services
docker-compose logs -f voice-agent  # App only
```

### Rebuilding
```bash
docker-compose down && docker-compose up --build
```

## Hardware Requirements

**Minimum:** 4 GB RAM, dual-core CPU, ~7 GB disk (Llama 3.2 1B)
**Recommended:** 8-16 GB RAM, quad-core CPU, ~10 GB disk (Llama 3.1 8B)

## Supported Query Types

- **Order status:** "What's the status of order 123?"
- **Product info:** "Do you have iPhone 15 Pro?" / "How much is product 5?"
- **Stock availability:** "What products are in stock?"
- **Purchase history:** "Show my last orders"
- **Shipping tracking:** "What's the tracking number for my order?"

## NLU Output Format

Llama returns structured JSON:
```json
{
  "intent": "order_status",
  "entities": {"order_id": 123},
  "query_type": "SELECT",
  "friendly_response": "Let me check order 123."
}
```

## RunPod Deployment (Single Container)

The project supports RunPod.io deployment via a single container that runs Ollama, MySQL, and the voice agent together using supervisord.

### Key Files

| File | Purpose |
|------|---------|
| `Dockerfile.runpod` | Single-container image (CUDA 12.2 + Ollama + MySQL + Python app) |
| `supervisord.conf` | Process manager for 3 services (ollama, mysql, voice-agent) |
| `scripts/start-runpod.sh` | Startup orchestration: persistent storage, DB init, model pull |

### Architecture Difference

| | Docker Compose (Local) | RunPod (Single Container) |
|---|---|---|
| **Containers** | 4 separate | 1 combined |
| **Service discovery** | Docker DNS (`mysql`, `ollama`) | `localhost` / `127.0.0.1` |
| **Process management** | Docker engine | supervisord |
| **Startup coordination** | `depends_on` + healthchecks | `start-runpod.sh` polling |
| **Persistent storage** | Docker volumes | `/workspace` (RunPod volume) |
| **GPU access** | Host passthrough | `--gpus all` (automatic) |

### Persistent Storage (`/workspace`)

| Path | Data |
|------|------|
| `/workspace/ollama-models` | Llama model files (~5 GB for 8b) |
| `/workspace/mysql-data` | MySQL database |
| `/workspace/.cache` | Whisper + TTS model caches |

### Build & Deploy

```bash
# Build the RunPod image
docker build -f Dockerfile.runpod -t apitap-agent:runpod .

# Local test (with GPU)
docker run --gpus all -p 8000:8000 \
  -v $(pwd)/workspace:/workspace \
  -e MYSQL_PASSWORD=test \
  -e OLLAMA_MODEL=llama3.2:1b \
  apitap-agent:runpod
```

### RunPod Template Environment Variables

```
MYSQL_HOST=127.0.0.1
MYSQL_PORT=3306
MYSQL_DATABASE=ecommerce
MYSQL_USER=root
MYSQL_PASSWORD=<secure_password>
OLLAMA_HOST=http://localhost:11434
OLLAMA_MODEL=llama3.1:8b
TTS_MODEL=tts_models/es/css10/vits
```

### Startup Sequence

1. Setup `/workspace` directories (first run: `mysqld --initialize-insecure`)
2. Start supervisord (ollama + mysql auto-start, voice-agent delayed)
3. Wait for MySQL readiness (poll `mysqladmin ping`)
4. First run: create DB user, run `init.sql`
5. Wait for Ollama readiness (poll `/api/tags`)
6. Pull Llama model if not present
7. Start voice-agent via `supervisorctl`

### GPU VRAM Requirements

| Model | VRAM (Ollama + Whisper + TTS) | Recommended GPU |
|-------|------|------|
| llama3.2:1b | ~3.5 GB | RTX 3060+ |
| llama3.2:3b | ~5 GB | RTX 3070+ |
| llama3.1:8b | ~7.5 GB | A4000, RTX 4090+ |

## Security Notes

- No authentication on API endpoints (designed for local/internal use)
- No rate limiting
- All credentials via environment variables
- CORS open to all origins
- For production: use HTTPS reverse proxy, restrict CORS, add auth, remove MySQL port exposure

## Version History

- **v2.0.0** (2026-02-02) — Hardware specs documentation, model selection guide, English UI
- **v1.0.0** (2026-02-01) — Initial release with Spanish interface, full voice pipeline
