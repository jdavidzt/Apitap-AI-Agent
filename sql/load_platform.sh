#!/bin/bash
# Load full platform databases (DBITEMS + DBCARDS) into MySQL
# Run after MySQL is initialized and init.sql has been loaded

set -e

MYSQL_PWD="${MYSQL_PASSWORD:-password}"
MYSQL_USR="${MYSQL_USER:-root}"
MYSQL_HST="${MYSQL_HOST:-127.0.0.1}"
SQL_DIR="${SQL_DIR:-/app/sql}"
MYSQL_CMD="mysql -u $MYSQL_USR -p$MYSQL_PWD -h $MYSQL_HST"

echo "=========================================="
echo "  Loading Platform Databases"
echo "=========================================="

# -----------------------------------------------
# 1. Load DBCARDS tables (21 tables, independent)
# -----------------------------------------------
echo "[1/4] Loading DBCARDS tables..."
COUNT=0
for f in ${SQL_DIR}/dbcards_tbl_*.sql; do
    if [ -f "$f" ]; then
        $MYSQL_CMD < "$f" 2>/dev/null
        COUNT=$((COUNT + 1))
    fi
done
echo "  Loaded ${COUNT} DBCARDS tables."

# -----------------------------------------------
# 2. Load DBITEMS tables (154 tables)
# -----------------------------------------------
echo "[2/4] Loading DBITEMS tables..."
COUNT=0
for f in ${SQL_DIR}/dbitems_tbl_*.sql; do
    if [ -f "$f" ]; then
        $MYSQL_CMD < "$f" 2>/dev/null
        COUNT=$((COUNT + 1))
    fi
done
echo "  Loaded ${COUNT} DBITEMS tables."

# -----------------------------------------------
# 3. Load routines (views, stored procedures)
# -----------------------------------------------
echo "[3/4] Loading routines..."
if [ -f "${SQL_DIR}/dbcards_routines.sql" ]; then
    $MYSQL_CMD < "${SQL_DIR}/dbcards_routines.sql" 2>/dev/null
    echo "  Loaded DBCARDS routines."
fi
if [ -f "${SQL_DIR}/dbitems_routines.sql" ]; then
    $MYSQL_CMD < "${SQL_DIR}/dbitems_routines.sql" 2>/dev/null
    echo "  Loaded DBITEMS routines."
fi

# -----------------------------------------------
# 4. Grant access to databases
# -----------------------------------------------
echo "[4/4] Granting database access..."
$MYSQL_CMD <<EOF
GRANT ALL PRIVILEGES ON dbcards.* TO '${MYSQL_USR}'@'localhost';
GRANT ALL PRIVILEGES ON dbcards.* TO '${MYSQL_USR}'@'%';
GRANT ALL PRIVILEGES ON dbitems.* TO '${MYSQL_USR}'@'localhost';
GRANT ALL PRIVILEGES ON dbitems.* TO '${MYSQL_USR}'@'%';
GRANT ALL PRIVILEGES ON dbcards.* TO 'root'@'localhost';
GRANT ALL PRIVILEGES ON dbitems.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
EOF
echo "  Access granted."

echo "=========================================="
echo "  Platform databases loaded successfully!"
echo "=========================================="
