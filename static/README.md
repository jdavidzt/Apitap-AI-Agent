# Interfaz Web de Chat con Voz

## Descripción

Interfaz web moderna y responsiva para interactuar con el Asistente de Voz de Servicio al Cliente mediante grabación de audio.

## Características

- 🎤 **Grabación de audio** directa desde el navegador
- 💬 **Interfaz de chat** intuitiva y moderna
- 🔊 **Reproducción automática** de respuestas en audio
- 📱 **Diseño responsivo** que funciona en móvil y desktop
- ⌨️ **Atajo de teclado**: Presiona `Espacio` para grabar/detener

## Cómo Usar

1. **Abrir la interfaz**: Navega a http://localhost:8001 en tu navegador

2. **Autorizar el micrófono**: La primera vez, el navegador pedirá permiso para acceder al micrófono

3. **Grabar tu consulta**:
   - Click en el botón del micrófono 🎤
   - O presiona la tecla `Espacio`
   - Habla tu consulta (por ejemplo: "¿Cuál es el estado de mi pedido 123?")
   - Click nuevamente para detener la grabación

4. **Ver la respuesta**:
   - Tu mensaje aparecerá transcrito en el chat
   - El asistente procesará tu consulta
   - La respuesta aparecerá en texto y audio
   - El audio se reproducirá automáticamente

## Ejemplos de Consultas

- "¿Cuál es el estado de mi pedido 123?"
- "¿Tienen iPhone 15 Pro disponible?"
- "¿Cuánto cuesta el producto número 5?"
- "Quiero información sobre mi último pedido"
- "¿Qué productos tienen en stock?"

## Tecnologías Utilizadas

### Frontend
- HTML5
- CSS3 (con gradientes y animaciones)
- JavaScript vanilla (sin frameworks)
- Web Audio API para grabación

### Backend (API)
- FastAPI
- OpenAI Whisper (STT)
- Llama 3.1 via Ollama (NLU)
- Coqui TTS (TTS)
- MySQL

## Características Técnicas

### Audio
- Formato: WebM/WAV
- Sample Rate recomendado: 16kHz
- Canales: Mono (1 canal)

### API Endpoints Utilizados
- `POST /process-voice`: Pipeline completo voz-a-voz
- `GET /download-audio`: Descargar audio de respuesta

## Troubleshooting

### El micrófono no funciona
- Verifica que autorizaste el acceso al micrófono
- En Chrome: Settings → Privacy → Microphone
- En Firefox: Preferences → Privacy → Permissions

### La interfaz no carga
- Verifica que el servidor esté corriendo: `docker ps`
- Revisa los logs: `docker logs voice-customer-service`

### El audio no se reproduce
- Verifica que el navegador soporta audio HTML5
- Algunos navegadores bloquean autoplay - click play manualmente

## Atajos de Teclado

- `Espacio`: Iniciar/detener grabación (cuando no estás en un campo de texto)

## Navegadores Soportados

- ✅ Chrome/Chromium 60+
- ✅ Firefox 55+
- ✅ Safari 11+
- ✅ Edge 79+

## Personalización

El archivo `static/index.html` contiene todo el código (HTML, CSS, JavaScript) en un solo archivo para facilitar la personalización.

### Cambiar colores
Busca las secciones con `background: linear-gradient` en el CSS para cambiar los colores del tema.

### Modificar el API URL
Si la API está en otro host, modifica las URLs en las llamadas `fetch()` en el JavaScript:
```javascript
const response = await fetch('http://TU_HOST:8001/process-voice', {
```

## Licencia

Este proyecto es 100% Open Source.
