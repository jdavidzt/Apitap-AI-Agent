# Apitap AI Voice Customer Service Agent 🎙️🤖

Agente de IA para servicio al cliente por voz para e-commerce, con entrada de voz, procesamiento inteligente de consultas conectado a base de datos MySQL, y respuestas en voz.

## 🎯 Características

- **Speech-to-Text (STT)**: Whisper base model con procesamiento de audio usando numpy y wave
- **Natural Language Understanding (NLU)**: GPT-4o mini para comprensión de intenciones y extracción de entidades
- **Base de Datos**: Integración completa con MySQL para e-commerce
- **Text-to-Speech (TTS)**: Eleven Labs con soporte multilingüe (español)
- **100% Open Source** (excepto APIs de OpenAI y Eleven Labs)
- **Totalmente Dockerizado**: Despliegue simple con Docker Compose

## 🏗️ Arquitectura

```
┌─────────────┐
│   Usuario   │
│  (Audio In) │
└──────┬──────┘
       │
       ▼
┌─────────────────────────────────────┐
│     Voice Agent API (FastAPI)       │
├─────────────────────────────────────┤
│                                     │
│  1. Whisper STT                     │
│     ↓                               │
│  2. GPT-4o mini (NLU)               │
│     ↓                               │
│  3. MySQL Database Query            │
│     ↓                               │
│  4. GPT-4o mini (Response Gen)      │
│     ↓                               │
│  5. Eleven Labs TTS                 │
│                                     │
└──────┬──────────────────────────────┘
       │
       ▼
┌─────────────┐
│   Usuario   │
│ (Audio Out) │
└─────────────┘
```

## 📋 Requisitos Previos

- Docker y Docker Compose instalados
- API Key de OpenAI (para GPT-4o mini)
- API Key de Eleven Labs (para TTS)

## 🚀 Instalación y Configuración

### 1. Clonar el repositorio

```bash
git clone <repository-url>
cd Apitap-AI-Agent
```

### 2. Configurar variables de entorno

```bash
cp .env.example .env
```

Edita el archivo `.env` con tus credenciales:

```bash
# OpenAI API Key
OPENAI_API_KEY=sk-your-openai-api-key-here

# Eleven Labs API Key
ELEVENLABS_API_KEY=your-elevenlabs-api-key-here

# Eleven Labs Voice ID (opcional, por defecto "Antoni")
ELEVENLABS_VOICE_ID=Antoni

# MySQL Password (cambia esto por seguridad)
MYSQL_PASSWORD=your_secure_password
```

#### 🔑 Obtener API Keys

**OpenAI API Key:**
1. Ve a [OpenAI Platform](https://platform.openai.com/)
2. Crea una cuenta o inicia sesión
3. Ve a [API Keys](https://platform.openai.com/api-keys)
4. Crea una nueva API key
5. Copia la key al archivo `.env`

**Eleven Labs API Key:**
1. Ve a [Eleven Labs](https://elevenlabs.io/)
2. Crea una cuenta o inicia sesión
3. Ve a tu perfil → API Keys
4. Copia tu API key al archivo `.env`

**Eleven Labs Voice ID (opcional):**
- Explora voces disponibles en [Voice Library](https://elevenlabs.io/voice-library)
- Voces populares en español:
  - **Antoni**: Voz masculina española
  - **Diego**: Voz masculina latinoamericana
  - **Domi**: Voz femenina española
  - **Valentino**: Voz masculina joven

### 3. Construir y ejecutar con Docker

```bash
# Construir e iniciar los servicios
docker-compose up --build

# O ejecutar en segundo plano
docker-compose up -d --build
```

La primera ejecución descargará el modelo Whisper (base), lo cual puede tomar algunos minutos.

### 4. Verificar que está funcionando

```bash
# Check API health
curl http://localhost:8000/health
```

Respuesta esperada:
```json
{
  "status": "healthy",
  "agent_initialized": true
}
```

## 📡 API Endpoints

### 1. **POST /process-voice** - Pipeline completo de voz a voz

Procesa audio de entrada y devuelve respuesta en audio.

```bash
curl -X POST http://localhost:8000/process-voice \
  -F "audio=@/path/to/audio.wav"
```

Respuesta:
```json
{
  "success": true,
  "response_text": "Tu pedido #123 está en camino...",
  "audio_url": "/download-audio?path=/tmp/response.mp3"
}
```

### 2. **POST /transcribe** - Solo transcripción

Convierte audio a texto.

```bash
curl -X POST http://localhost:8000/transcribe \
  -F "audio=@/path/to/audio.wav"
```

### 3. **POST /text-query** - Consulta de texto

Procesa una consulta de texto y devuelve respuesta en texto y audio.

```bash
curl -X POST http://localhost:8000/text-query \
  -H "Content-Type: application/json" \
  -d '{"text": "¿Cuál es el estado de mi pedido 123?"}'
```

### 4. **POST /synthesize** - Solo síntesis de voz

Convierte texto a audio.

```bash
curl -X POST http://localhost:8000/synthesize \
  -H "Content-Type: application/json" \
  -d '{"text": "Hola, ¿en qué puedo ayudarte hoy?"}'
```

### 5. **GET /download-audio** - Descargar audio generado

```bash
curl http://localhost:8000/download-audio?path=/tmp/response.mp3 \
  --output response.mp3
```

## 🗄️ Base de Datos

La base de datos MySQL se inicializa automáticamente con:

### Tablas principales:

- **customers**: Información de clientes
- **products**: Catálogo de productos
- **orders**: Pedidos realizados
- **order_items**: Detalles de cada pedido

### Datos de ejemplo:

- 5 clientes
- 10 productos (smartphones, laptops, accesorios, etc.)
- 6 pedidos con diferentes estados

### Consultas soportadas:

El agente puede responder a consultas sobre:
- Estado de pedidos
- Información de productos
- Historial de compras
- Tracking de envíos
- Disponibilidad de stock

## 🛠️ Desarrollo Local

### Estructura del proyecto

```
Apitap-AI-Agent/
├── src/
│   ├── api/
│   │   └── server.py          # FastAPI server
│   ├── services/
│   │   └── voice_agent.py     # Main agent logic
│   └── utils/
│       ├── audio_processor.py # Audio processing (numpy + wave)
│       └── database.py        # MySQL integration
├── sql/
│   └── init.sql              # Database schema & sample data
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── .env.example
└── README.md
```

### Ejecutar sin Docker (desarrollo)

```bash
# Crear entorno virtual
python -m venv venv
source venv/bin/activate  # En Windows: venv\Scripts\activate

# Instalar dependencias
pip install -r requirements.txt

# Asegurarte que MySQL esté corriendo
# Configurar .env con credenciales de MySQL local

# Ejecutar servidor
uvicorn src.api.server:app --reload --host 0.0.0.0 --port 8000
```

## 📊 Ejemplo de Uso

### Escenario 1: Cliente pregunta por estado de pedido

**Entrada (audio):** "Hola, me gustaría saber el estado de mi pedido número 123"

**Procesamiento:**
1. Whisper transcribe el audio
2. GPT-4o mini identifica:
   - Intent: `order_status`
   - Entity: `order_id = 123`
3. Se consulta MySQL para obtener información del pedido
4. GPT-4o mini genera respuesta contextual
5. Eleven Labs sintetiza la respuesta en audio

**Salida (audio):** "Hola! Tu pedido número 123 está en camino. Fue enviado el día 10 de enero y el número de tracking es ES123456789. Deberías recibirlo en los próximos 2-3 días laborables."

### Escenario 2: Cliente busca información de producto

**Entrada:** "¿Tienen iPhone 15 Pro disponible y cuánto cuesta?"

**Respuesta:** "Sí, tenemos el iPhone 15 Pro disponible. El precio es 1199.99 euros y actualmente tenemos 50 unidades en stock."

## 🐛 Troubleshooting

### Error: "Agent not initialized"

- Verifica que las API keys estén configuradas correctamente en `.env`
- Revisa los logs: `docker-compose logs voice-agent`

### Error: "Database connection failed"

- Espera a que MySQL esté completamente inicializado (puede tomar 30-60 segundos)
- Verifica: `docker-compose logs mysql`

### Error de Whisper: Model download

- La primera vez que se ejecuta, Whisper descarga el modelo (~150MB)
- Esto es normal y solo ocurre una vez

### Audio no se procesa correctamente

- Asegúrate de usar formato WAV
- Frecuencia de muestreo recomendada: 16kHz
- Mono channel (1 canal)

## 🔧 Configuración Avanzada

### Cambiar modelo de Whisper

En `src/services/voice_agent.py:28`:

```python
# Opciones: tiny, base, small, medium, large
self.whisper_model = whisper.load_model("base")
```

**Nota:** Modelos más grandes son más precisos pero requieren más memoria.

### Usar diferentes voces de Eleven Labs

Puedes cambiar la voz editando `.env`:

```bash
ELEVENLABS_VOICE_ID=Domi  # Voz femenina española
```

O programáticamente en cada llamada.

### Modificar el prompt del NLU

Edita `src/services/voice_agent.py:87-100` para ajustar cómo GPT-4o mini interpreta las consultas.

## 📝 Logs y Monitoreo

```bash
# Ver logs en tiempo real
docker-compose logs -f

# Ver logs de un servicio específico
docker-compose logs -f voice-agent
docker-compose logs -f mysql

# Ver últimas 100 líneas
docker-compose logs --tail=100 voice-agent
```

## 🧪 Testing

### Test manual con curl

```bash
# 1. Graba un audio con tu pregunta (por ejemplo, pregunta.wav)

# 2. Envía la consulta
curl -X POST http://localhost:8000/process-voice \
  -F "audio=@pregunta.wav" \
  -o response.json

# 3. Descarga el audio de respuesta
# (Extrae el path del response.json)
curl "http://localhost:8000/download-audio?path=/tmp/response.mp3" \
  --output respuesta.mp3

# 4. Reproduce el audio
# En Linux:
mpg123 respuesta.mp3
# En Mac:
afplay respuesta.mp3
```

## 🚀 Despliegue en Producción

### Consideraciones de seguridad:

1. **Cambiar contraseñas por defecto:**
   ```bash
   MYSQL_PASSWORD=<contraseña-segura-única>
   ```

2. **No exponer MySQL directamente:**
   - Elimina el port mapping de MySQL en `docker-compose.yml`

3. **Usar HTTPS:**
   - Configura un reverse proxy (nginx, Traefik)
   - Obtén certificados SSL (Let's Encrypt)

4. **Variables de entorno seguras:**
   - Usa secrets management (AWS Secrets Manager, HashiCorp Vault)

5. **Rate limiting:**
   - Implementa rate limiting en la API para prevenir abuso

### Escalabilidad:

- Considera usar un servicio de base de datos administrado (AWS RDS, Google Cloud SQL)
- Deploy múltiples instancias del voice-agent detrás de un load balancer
- Usa Redis para caché de respuestas frecuentes

## 📄 Licencia

Este proyecto utiliza componentes open source y APIs de terceros:

- **Open Source**: FastAPI, Whisper, numpy, wave, MySQL
- **APIs Propietarias**: OpenAI API (GPT-4o mini), Eleven Labs API

Consulta los términos de servicio de cada proveedor.

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📧 Soporte

Para preguntas o problemas:
- Abre un issue en GitHub
- Contacta al equipo de desarrollo

## 🎉 Créditos

Desarrollado con:
- [OpenAI Whisper](https://github.com/openai/whisper)
- [GPT-4o mini](https://openai.com/)
- [Eleven Labs](https://elevenlabs.io/)
- [FastAPI](https://fastapi.tiangolo.com/)
- [MySQL](https://www.mysql.com/)

---

**¡Disfruta construyendo con el Voice Customer Service Agent! 🎙️✨**