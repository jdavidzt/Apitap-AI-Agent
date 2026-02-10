#!/bin/bash
# Initialize Ollama with Llama 3.1 model

# Use OLLAMA_HOST env var if set, otherwise default to localhost
# docker-compose sets OLLAMA_HOST=http://ollama:11434, RunPod defaults to localhost
OLLAMA_URL="${OLLAMA_HOST:-http://localhost:11434}"

echo "Waiting for Ollama service to be ready at ${OLLAMA_URL}..."
until curl -s ${OLLAMA_URL}/api/tags > /dev/null 2>&1; do
    echo "Waiting for Ollama..."
    sleep 2
done

echo "Ollama is ready! Pulling Llama 3.1 model..."

# Pull the model
MODEL_NAME="${OLLAMA_MODEL:-llama3.1:8b}"
echo "Pulling model: $MODEL_NAME"

curl -X POST ${OLLAMA_URL}/api/pull \
    -H "Content-Type: application/json" \
    -d "{\"name\": \"$MODEL_NAME\"}" \
    --no-buffer

echo "Model $MODEL_NAME pulled successfully!"

# Verify the model is available
echo "Verifying model availability..."
curl -s ${OLLAMA_URL}/api/tags | grep -q "$MODEL_NAME"

if [ $? -eq 0 ]; then
    echo "✓ Model $MODEL_NAME is ready to use!"
else
    echo "✗ Warning: Model may not be fully loaded yet"
fi

echo "Ollama initialization complete!"
