#!/bin/bash
set -e

echo "=========================================="
echo "  Apitap AI Agent - RunPod Startup"
echo "=========================================="

# -----------------------------------------------
# 1. Set up persistent storage directories
# -----------------------------------------------
echo "[1/6] Setting up persistent storage..."

# Ollama models directory (persists across pod restarts)
mkdir -p /workspace/ollama-models
export OLLAMA_MODELS="/workspace/ollama-models"

# Whisper + TTS model caches (persists across pod restarts)
mkdir -p /workspace/.cache
export XDG_CACHE_HOME="/workspace"

# MySQL data directory
if [ ! -d "/workspace/mysql-data/mysql" ]; then
    echo "  First run detected - initializing MySQL data directory..."
    mkdir -p /workspace/mysql-data
    mysqld --initialize-insecure --user=mysql --datadir=/workspace/mysql-data
    FIRST_RUN=true
else
    echo "  MySQL data directory exists - reusing."
    FIRST_RUN=false
fi

# Ensure correct ownership
chown -R mysql:mysql /workspace/mysql-data
mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

# -----------------------------------------------
# 2. Start supervisord (starts ollama + mysql)
# -----------------------------------------------
echo "[2/6] Starting supervisord (ollama + mysql)..."
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf &
SUPERVISOR_PID=$!

# Give processes a moment to initialize
sleep 3

# -----------------------------------------------
# 3. Wait for MySQL readiness
# -----------------------------------------------
echo "[3/6] Waiting for MySQL..."
MAX_RETRIES=30
RETRY=0
until mysqladmin ping -h 127.0.0.1 --silent 2>/dev/null; do
    RETRY=$((RETRY + 1))
    if [ $RETRY -ge $MAX_RETRIES ]; then
        echo "  ERROR: MySQL failed to start after ${MAX_RETRIES} retries"
        exit 1
    fi
    echo "  Waiting for MySQL... (${RETRY}/${MAX_RETRIES})"
    sleep 2
done
echo "  MySQL is ready!"

# -----------------------------------------------
# 4. Initialize database on first run
# -----------------------------------------------
if [ "$FIRST_RUN" = true ]; then
    echo "[4/6] First run - initializing database..."

    MYSQL_PWD="${MYSQL_PASSWORD:-password}"
    MYSQL_DB="${MYSQL_DATABASE:-ecommerce}"
    MYSQL_USR="${MYSQL_USER:-root}"

    # Set root password and create database/user
    mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_PWD}';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DB};
CREATE USER IF NOT EXISTS '${MYSQL_USR}'@'localhost' IDENTIFIED BY '${MYSQL_PWD}';
CREATE USER IF NOT EXISTS '${MYSQL_USR}'@'%' IDENTIFIED BY '${MYSQL_PWD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${MYSQL_USR}'@'localhost';
GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${MYSQL_USR}'@'%';
GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
EOF

    # Run init.sql to create demo tables and sample data
    if [ -f /app/sql/init.sql ]; then
        echo "  Running init.sql (demo data)..."
        mysql -u root -p"${MYSQL_PWD}" < /app/sql/init.sql
        echo "  Demo database initialized."
    fi

    # Load full platform databases (DBITEMS + DBCARDS)
    if [ -f /app/sql/load_platform.sh ]; then
        echo "  Loading platform databases (DBITEMS + DBCARDS)..."
        chmod +x /app/sql/load_platform.sh
        MYSQL_PASSWORD="${MYSQL_PWD}" MYSQL_USER="${MYSQL_USR}" /app/sql/load_platform.sh
        echo "  Platform databases loaded."
    fi
else
    echo "[4/6] Database already initialized - skipping."
fi

# -----------------------------------------------
# 5. Wait for Ollama and pull model
# -----------------------------------------------
echo "[5/6] Waiting for Ollama..."
MAX_RETRIES=30
RETRY=0
until curl -s http://localhost:11434/api/tags > /dev/null 2>&1; do
    RETRY=$((RETRY + 1))
    if [ $RETRY -ge $MAX_RETRIES ]; then
        echo "  ERROR: Ollama failed to start after ${MAX_RETRIES} retries"
        exit 1
    fi
    echo "  Waiting for Ollama... (${RETRY}/${MAX_RETRIES})"
    sleep 2
done
echo "  Ollama is ready!"

# Pull model if not already present
MODEL_NAME="${OLLAMA_MODEL:-llama3.1:8b}"
echo "  Checking for model: ${MODEL_NAME}"
if ! curl -s http://localhost:11434/api/tags | grep -q "${MODEL_NAME}"; then
    echo "  Pulling model ${MODEL_NAME}... (this may take several minutes)"
    curl -X POST http://localhost:11434/api/pull \
        -H "Content-Type: application/json" \
        -d "{\"name\": \"${MODEL_NAME}\"}" \
        --no-buffer
    echo ""
    echo "  Model ${MODEL_NAME} pulled successfully!"
else
    echo "  Model ${MODEL_NAME} already present."
fi

# -----------------------------------------------
# 6. Start voice-agent via supervisord
# -----------------------------------------------
echo "[6/6] Starting voice-agent..."
supervisorctl start voice-agent
echo "  Voice agent started!"

echo "=========================================="
echo "  All services running!"
echo "  API: http://localhost:8000"
echo "  Ollama: http://localhost:11434"
echo "=========================================="

# Keep container alive by waiting on supervisord
wait $SUPERVISOR_PID
