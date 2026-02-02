# Changelog

All notable changes to the Apitap AI Voice Customer Service Agent will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-02-02

### Added
- **Hardware Specifications Section** in README
  - Minimum configuration (current setup with Llama 3.2 1B)
  - Recommended configuration (full-featured with Llama 3.1 8B)
  - Model comparison table with detailed specs
  - Performance expectations for each configuration
- **Complete English Translation** of all documentation
  - README fully translated to English
  - Web interface in English (v3.0)
  - All API documentation in English
- **Multi-Model Support** documentation
  - Llama 3.2 1B (1.3 GB) for limited resources
  - Llama 3.2 3B (2.0 GB) for balanced performance
  - Llama 3.1 8B (4.9 GB) for production use
  - Llama 3.1 70B (40 GB) for high-end servers
- **Web Chat Interface** (v3.0)
  - Apitap branding with green theme (#7BA428, #6B9420)
  - Minimalist SVG icons (mic, recording, stop)
  - English interface with improved UX
  - Real-time voice recording and playback
  - Automatic audio format conversion (WebM to WAV)

### Changed
- **AI Response System** improvements
  - Updated system prompts to English
  - Enhanced entity extraction examples
  - Direct database usage without asking for more information
  - Improved response generation for natural conversation
- **Model Configuration**
  - Default model changed from Llama 3.1 8B to Llama 3.2 1B
  - Added support for smaller models (1B, 3B parameters)
  - Updated .env.example with all available model options
- **API Version** updated to 2.0.0
- **Documentation Structure**
  - Reorganized README with hardware specs first
  - Added troubleshooting section for model accuracy
  - Enhanced setup instructions with model download info

### Fixed
- Entity extraction inconsistencies with smaller models
- Spanish responses when database data was available
- Response prompts asking for more information unnecessarily
- Audio processing compatibility (WebM to WAV conversion)
- Browser cache issues with versioning system

## [1.0.0] - 2026-02-01

### Added
- Initial release of Apitap AI Voice Customer Service Agent
- Speech-to-Text using OpenAI Whisper
- Natural Language Understanding using Llama 3.1 8B via Ollama
- Text-to-Speech using Coqui TTS (Spanish)
- MySQL database integration for e-commerce
- Docker Compose deployment
- FastAPI REST API with endpoints:
  - `/process-voice` - Complete voice-to-voice pipeline
  - `/transcribe` - Audio to text
  - `/text-query` - Text query processing
  - `/synthesize` - Text to speech
  - `/health` - Health check
- Sample database with customers, products, and orders
- 100% Open Source - no paid APIs required
- Full Spanish interface and documentation

### Features
- Voice-to-voice customer service automation
- Order status queries
- Product information queries
- Stock availability checks
- Shipping tracking integration
- Complete privacy - all processing done locally

---

## Version Format

**MAJOR.MINOR.PATCH**

- **MAJOR**: Incompatible API changes or major feature overhauls
- **MINOR**: New features in a backwards compatible manner
- **PATCH**: Backwards compatible bug fixes

---

**Repository**: [Apitap AI Voice Customer Service Agent](https://github.com/your-org/Apitap-AI-Agent)
