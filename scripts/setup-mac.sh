#!/bin/bash
# ===========================================
# Apitap AI Agent - Mac Mini M4 Setup
# One-time setup script
# ===========================================
set -e

echo "=========================================="
echo "  Apitap AI Agent - Mac Setup"
echo "=========================================="

# -----------------------------------------------
# 1. Check prerequisites
# -----------------------------------------------
echo "[1/7] Checking prerequisites..."

if ! command -v brew &> /dev/null; then
    echo "  ERROR: Homebrew not found. Install it first:"
    echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

if ! command -v python3 &> /dev/null; then
    echo "  ERROR: Python 3 not found. Install with: brew install python@3.10"
    exit 1
fi

echo "  Homebrew and Python 3 found."

# -----------------------------------------------
# 2. Install system dependencies
# -----------------------------------------------
echo "[2/7] Installing system dependencies..."

brew install mysql 2>/dev/null || echo "  MySQL already installed."
brew install ollama 2>/dev/null || echo "  Ollama already installed."
brew install ffmpeg 2>/dev/null || echo "  FFmpeg already installed."
brew install rust 2>/dev/null || echo "  Rust already installed."
brew install python@3.11 2>/dev/null || echo "  Python 3.11 already installed."

echo "  System dependencies ready."

# -----------------------------------------------
# 3. Start MySQL and configure
# -----------------------------------------------
echo "[3/7] Setting up MySQL..."

brew services start mysql 2>/dev/null || true
sleep 2

# Wait for MySQL to be ready
MAX_RETRIES=15
RETRY=0
until mysqladmin ping --silent 2>/dev/null; do
    RETRY=$((RETRY + 1))
    if [ $RETRY -ge $MAX_RETRIES ]; then
        echo "  ERROR: MySQL failed to start"
        exit 1
    fi
    echo "  Waiting for MySQL... (${RETRY}/${MAX_RETRIES})"
    sleep 2
done

echo "  MySQL is running."

# Create ecommerce database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ecommerce;" 2>/dev/null
echo "  Database 'ecommerce' ready."

# -----------------------------------------------
# 4. Load demo database
# -----------------------------------------------
echo "[4/7] Loading demo database..."

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

if [ -f "${PROJECT_DIR}/sql/init.sql" ]; then
    if mysql -u root < "${PROJECT_DIR}/sql/init.sql" 2>&1; then
        echo "  Demo data loaded (customers, products, orders)."
    else
        echo "  WARNING: Demo data load had errors (tables may already exist). Continuing..."
    fi
else
    echo "  WARNING: sql/init.sql not found, skipping demo data."
fi

# -----------------------------------------------
# 5. Load platform databases (optional)
# -----------------------------------------------
echo "[5/7] Loading platform databases..."

if [ -f "${PROJECT_DIR}/sql/load_platform.sh" ]; then
    # Check if platform SQL files exist
    PLATFORM_COUNT=$(ls "${PROJECT_DIR}"/sql/dbitems_tbl_*.sql 2>/dev/null | wc -l)
    if [ "$PLATFORM_COUNT" -gt 0 ]; then
        chmod +x "${PROJECT_DIR}/sql/load_platform.sh"
        if MYSQL_HOST=127.0.0.1 MYSQL_USER=root MYSQL_PASSWORD="" SQL_DIR="${PROJECT_DIR}/sql" \
            bash "${PROJECT_DIR}/sql/load_platform.sh" 2>&1; then
            echo "  Platform databases loaded."
        else
            echo "  WARNING: Platform database load had errors. Continuing..."
        fi
    else
        echo "  No platform SQL files found, skipping."
    fi
else
    echo "  load_platform.sh not found, skipping."
fi

# -----------------------------------------------
# 6. Create Python virtual environment (Python 3.11 required by Coqui TTS)
# -----------------------------------------------
echo "[6/7] Setting up Python environment..."

cd "$PROJECT_DIR"

# Find Python 3.11 (required: Coqui TTS only supports Python < 3.12)
PYTHON311=""
if command -v python3.11 &> /dev/null; then
    PYTHON311="python3.11"
elif [ -f "$(brew --prefix python@3.11)/bin/python3.11" ]; then
    PYTHON311="$(brew --prefix python@3.11)/bin/python3.11"
fi

if [ -z "$PYTHON311" ]; then
    echo "  ERROR: Python 3.11 not found. Install with: brew install python@3.11"
    echo "  (Coqui TTS requires Python < 3.12)"
    exit 1
fi

echo "  Using: $($PYTHON311 --version)"

if [ ! -d "venv" ]; then
    $PYTHON311 -m venv venv
    echo "  Virtual environment created (Python 3.11)."
else
    echo "  Virtual environment already exists."
fi

source venv/bin/activate
pip install --upgrade pip setuptools wheel --quiet
echo "  Installing Python dependencies (this may take a few minutes)..."

# Step 1: Install PyTorch first (required by whisper and TTS)
echo "  [1/4] Installing PyTorch..."
pip install torch torchaudio

# Step 2: Install core dependencies
echo "  [2/4] Installing core dependencies..."
pip install -r requirements.txt

# Step 3: Install OpenAI Whisper from source (avoids Apple Silicon build issues)
echo "  [3/4] Installing OpenAI Whisper..."
pip install openai-whisper

# Step 4: Install Coqui TTS
echo "  [4/4] Installing Coqui TTS..."
pip install TTS==0.22.0 || pip install TTS

echo "  Python dependencies installed."

# -----------------------------------------------
# 7. Setup Ollama and pull model
# -----------------------------------------------
echo "[7/7] Setting up Ollama..."

# Start Ollama if not running
if ! curl -s http://localhost:11434/api/tags > /dev/null 2>&1; then
    echo "  Starting Ollama..."
    ollama serve &
    sleep 3
fi

MODEL_NAME="${OLLAMA_MODEL:-llama3.2:1b}"
echo "  Pulling model: ${MODEL_NAME} (this may take a few minutes on first run)..."
ollama pull "$MODEL_NAME"
echo "  Model ${MODEL_NAME} ready."

echo ""
echo "=========================================="
echo "  Setup complete!"
echo "=========================================="
echo ""
echo "  To start the agent:"
echo "    bash scripts/start-local.sh"
echo ""
echo "  Then open: http://localhost:8000"
echo "=========================================="
