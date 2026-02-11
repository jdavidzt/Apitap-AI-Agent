# CLAUDE.md - Apitap Customer Service Agent

## Project Overview

**Apitap Customer Service Agent** is a locally-run, AI-powered customer service system for e-commerce with **multi-profile support**. It processes both **voice and text queries** end-to-end with profile-aware responses for 4 user types: Consumer, Merchant, Reseller, Admin. All using 100% open-source models with NO paid APIs. Optimized for **Mac Mini M4**.

**Current Version:** 3.1.0

## Tech Stack

- **Language:** Python 3.11 (required by Coqui TTS)
- **Web Framework:** FastAPI + Uvicorn
- **STT:** OpenAI Whisper (`tiny` model, ~75 MB)
- **LLM:** Llama 3.2 1B via Ollama (local, no API key)
- **TTS:** Coqui TTS 0.22.0 (Spanish: `tts_models/es/css10/vits`)
- **Database:** MySQL (Homebrew) — 3 platform DBs + 1 agent DB
- **Frontend:** Vanilla HTML/JS — profile selector, capability cards, query logs

## Project Structure

```
Apitap-AI-Agent/
├── src/
│   ├── api/
│   │   └── server.py              # FastAPI (v3.1.0) — multi-profile endpoints
│   ├── services/
│   │   └── voice_agent.py         # Core agent: profile-aware NLU + DB dispatch
│   └── utils/
│       ├── audio_processor.py     # Audio format handling
│       └── database.py            # MySQL multi-DB queries + PROFILE_CAPABILITIES + logging
├── static/
│   └── index.html                 # Web UI (v5.0): profile selector, capabilities tab, logs tab
├── sql/
│   ├── init.sql                   # Demo e-commerce (4 tables)
│   ├── create_agent_log.sql       # Query log table (apitap_agent.query_log)
│   ├── load_platform.sh           # Loads DBITEMS + DBCARDS + DBUSER databases
│   └── [335+ SQL files]           # Full platform: dbitems, dbcards, dbuser
├── scripts/
│   ├── setup-mac.sh               # One-time Mac setup (Python 3.11, Homebrew, models)
│   └── start-local.sh             # Daily startup (MySQL, Ollama, FastAPI)
├── requirements.txt
├── .env.example
├── VERSION                        # 3.1.0
└── CLAUDE.md
```

## Quick Start (Mac Mini M4)

```bash
bash scripts/setup-mac.sh     # One-time
bash scripts/start-local.sh   # Daily
open http://localhost:8000
```

## User Profiles

### Consumer (tbl_usertype_id = 1)
| Capability | Intent | Description |
|-----------|--------|-------------|
| Product Search | `product_search` | Search by name, brand, keyword |
| Product Details | `product_info` | Price, description, availability |
| Order Status | `order_status` | Check by order ID or number |
| Payment Methods | `payment_info` | Accepted cards and providers |
| Store Locations | `store_locations` | Find stores, nearby with geo |
| Table Availability | `table_availability` | Restaurant seating status |

### Merchant (tbl_usertype_id = 2)
| Capability | Intent | Description |
|-----------|--------|-------------|
| Sales Summary | `sales_summary` | Weekly/monthly/quarterly totals |
| Top Products | `top_products` | Best selling products |
| Bottom Products | `bottom_products` | Worst selling products |
| Sales by Location | `sales_by_location` | Revenue per store |
| Recent Orders | `recent_orders` | Latest orders with status |
| Inventory Status | `inventory_status` | Stock levels, low-stock alerts |
| Order Lookup | `order_status` | Specific order by ID/number |

### Reseller (via tbl_reseller linkage)
| Capability | Intent | Description |
|-----------|--------|-------------|
| My Merchants | `merchant_list` | Merchants under management |
| Performance | `merchant_performance` | Aggregated merchant sales |
| Equipment | `equipment_summary` | Dongles, tablets, TVs deployed |
| Subscriptions | `subscription_overview` | Tier counts across merchants |

### Admin (tbl_usertype_id = 4)
| Capability | Intent | Description |
|-----------|--------|-------------|
| Platform Stats | `platform_stats` | Total orders, revenue, merchants |
| User Counts | `user_counts` | Users by type |
| Order Overview | `order_overview` | Orders by status |
| Revenue Report | `revenue_report` | Revenue by daily/weekly/monthly |
| All Merchants | `merchant_list` | Full merchant directory |

## API Endpoints

| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/` | Web UI |
| `GET` | `/health` | Health check |
| `GET` | `/capabilities` | Profile capability inventory |
| `GET` | `/capabilities?profile=merchant` | Single profile capabilities |
| `POST` | `/text-query` | Text query with `{text, profile, user_context}` |
| `POST` | `/process-voice` | Voice with `audio` + `profile` + `user_context` (Form) |
| `GET` | `/query-logs?limit=50&profile=consumer` | Recent query logs |
| `GET` | `/query-stats` | Aggregated stats by profile |
| `POST` | `/transcribe` | Audio to text only |
| `POST` | `/synthesize` | Text to speech only |
| `GET` | `/download-audio` | Download WAV file |

## Query Logging

All queries are logged to `apitap_agent.query_log`:
- `user_profile` — consumer/merchant/reseller/admin
- `user_id` — simulated user ID from profile selector
- `query_text` — original query
- `intent` — detected NLU intent
- `response_text` — agent's response
- `db_data_found` — whether DB returned data (effectiveness metric)
- `response_time_ms` — processing time
- `input_method` — text or voice

The Logs tab in the UI shows stats cards and a detailed log table.

## Database Architecture

### 4 Databases
1. **dbitems** (154 tables) — Products, orders, categories, carts
2. **dbcards** (21 tables) — Cards, payments, providers
3. **dbuser** (119 tables) — Merchants, resellers, locations, seating
4. **apitap_agent** (1 table) — Query log

### Key Tables per Profile

**Consumer:** `dbitems.tbl_product`, `dbitems.tbl_order`, `dbitems.tbl_orderstatus`, `dbcards.tbl_cardstype`, `dbuser.tbl_location`, `dbuser.tbl_location_table`

**Merchant:** `dbitems.tbl_order` (by merchant_id), `dbitems.tbl_orderdetail`, `dbitems.tbl_product` (by owner), `dbuser.tbl_location`

**Reseller:** `dbuser.tbl_merchant` (by reseller_id), `dbitems.tbl_order` (aggregated)

**Admin:** All tables (aggregated counts and sums)

## Web UI (v5.0)

3-tab interface:
1. **Chat** — Mic + text input, profile badge on messages, response time display
2. **Capabilities** — Visual grid of what each profile can ask, active profile highlighted
3. **Query Logs** — Stats cards (total queries, data found rate) + detailed log table with color-coded profile badges

Profile selector dropdown in header switches context for NLU, welcome messages, and placeholders.

## Testing

```bash
# Consumer query
curl -X POST http://localhost:8000/text-query \
  -H "Content-Type: application/json" \
  -d '{"text": "Search for laptops", "profile": "consumer"}'

# Merchant query
curl -X POST http://localhost:8000/text-query \
  -H "Content-Type: application/json" \
  -d '{"text": "Monthly sales", "profile": "merchant", "user_context": {"merchant_id": 1}}'

# Admin query
curl -X POST http://localhost:8000/text-query \
  -H "Content-Type: application/json" \
  -d '{"text": "Platform stats", "profile": "admin"}'

# Capabilities
curl http://localhost:8000/capabilities

# Query logs
curl http://localhost:8000/query-logs?limit=10
```

## Version History

- **v3.1.0** (2026-02-11) — Multi-profile support (Consumer/Merchant/Reseller/Admin), profile-aware NLU, query logging, capabilities API, dbuser database, 3-tab UI
- **v3.0.0** (2026-02-10) — Local Mac M4 setup, removed Docker, text input, Whisper tiny, llama3.2:1b
- **v2.0.0** (2026-02-02) — Docker Compose + RunPod deployment, platform DB support
- **v1.0.0** (2026-02-01) — Initial release with Spanish interface, full voice pipeline
