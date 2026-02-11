-- Agent Query Log Table
-- Tracks all queries per user profile for effectiveness and satisfaction analysis

CREATE DATABASE IF NOT EXISTS apitap_agent;
USE apitap_agent;

CREATE TABLE IF NOT EXISTS query_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_profile VARCHAR(20) NOT NULL COMMENT 'consumer, merchant, reseller, admin',
    user_id VARCHAR(45) DEFAULT NULL COMMENT 'Simulated user ID from profile selector',
    query_text TEXT NOT NULL COMMENT 'Original user query',
    intent VARCHAR(50) DEFAULT NULL COMMENT 'Detected intent from NLU',
    response_text TEXT COMMENT 'Agent response',
    db_data_found BOOLEAN DEFAULT FALSE COMMENT 'Whether DB returned relevant data',
    response_time_ms INT DEFAULT NULL COMMENT 'Total processing time in milliseconds',
    input_method VARCHAR(10) DEFAULT 'text' COMMENT 'text or voice',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_profile (user_profile),
    INDEX idx_created (created_at),
    INDEX idx_intent (intent)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
