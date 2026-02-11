#!/bin/bash
# ===========================================
# Apitap AI Agent - Local Startup
# Run this to start all services locally
# ===========================================
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=========================================="
echo "  Apitap AI Agent - Starting..."
echo "=========================================="

# -----------------------------------------------
# 1. Ensure MySQL is running
# -----------------------------------------------
echo "[1/3] Checking MySQL..."
if ! mysqladmin ping --silent 2>/dev/null; then
    echo "  Starting MySQL..."
    brew services start mysql 2>/dev/null || true
    sleep 2
    if ! mysqladmin ping --silent 2>/dev/null; then
        echo "  ERROR: MySQL not running. Run 'brew services start mysql' first."
        exit 1
    fi
fi
echo "  MySQL is running."

# -----------------------------------------------
# 2. Ensure Ollama is running
# -----------------------------------------------
echo "[2/3] Checking Ollama..."
if ! curl -s http://localhost:11434/api/tags > /dev/null 2>&1; then
    echo "  Starting Ollama..."
    ollama serve > /dev/null 2>&1 &
    sleep 3
    if ! curl -s http://localhost:11434/api/tags > /dev/null 2>&1; then
        echo "  ERROR: Ollama not running. Run 'ollama serve' first."
        exit 1
    fi
fi
echo "  Ollama is running."

# -----------------------------------------------
# 3. Start FastAPI server
# -----------------------------------------------
echo "[3/3] Starting FastAPI server..."

cd "$PROJECT_DIR"

# Activate virtual environment
if [ -d "venv" ]; then
    source venv/bin/activate
else
    echo "  ERROR: Virtual environment not found. Run 'bash scripts/setup-mac.sh' first."
    exit 1
fi

echo ""
echo "=========================================="
echo "  All services running!"
echo "  Web UI:  http://localhost:8000"
echo "  API:     http://localhost:8000/api"
echo "  Health:  http://localhost:8000/health"
echo "=========================================="
echo ""

# Start uvicorn (foreground so Ctrl+C stops it)
python -m uvicorn src.api.server:app --host 0.0.0.0 --port 8000 --reload
