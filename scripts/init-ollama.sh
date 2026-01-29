#!/bin/bash
# Initialize Ollama with Llama 3.1 model

echo "Waiting for Ollama service to be ready..."
until curl -s http://ollama:11434/api/tags > /dev/null 2>&1; do
    echo "Waiting for Ollama..."
    sleep 2
done

echo "Ollama is ready! Pulling Llama 3.1 model..."

# Pull the model
MODEL_NAME="${OLLAMA_MODEL:-llama3.1:8b}"
echo "Pulling model: $MODEL_NAME"

curl -X POST http://ollama:11434/api/pull \
    -H "Content-Type: application/json" \
    -d "{\"name\": \"$MODEL_NAME\"}" \
    --no-buffer

echo "Model $MODEL_NAME pulled successfully!"

# Verify the model is available
echo "Verifying model availability..."
curl -s http://ollama:11434/api/tags | grep -q "$MODEL_NAME"

if [ $? -eq 0 ]; then
    echo "✓ Model $MODEL_NAME is ready to use!"
else
    echo "✗ Warning: Model may not be fully loaded yet"
fi

echo "Ollama initialization complete!"
