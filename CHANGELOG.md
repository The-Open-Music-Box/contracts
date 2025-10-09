# Changelog

All notable changes to TheOpenMusicBox API contracts will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.0.0] - 2025-01-09

### Added
- Initial OpenAPI 3.0 specification
- Complete REST API contracts for all endpoints
- Socket.IO event contracts in JSON Schema format
- Multi-language code generation support:
  - Dart/Flutter client
  - C++ client (cpp-restsdk)
  - TypeScript types
  - Python Pydantic models
- Automated CI/CD pipeline for contract generation
- Comprehensive documentation

### Endpoints Included
- Health check (`/api/health`)
- Player control (`/api/player/*`)
- Playlist management (`/api/playlists/*`)
- NFC association (`/api/nfc/*`)
- System information (`/api/system/*`)
- YouTube download (`/api/youtube/*`)
- Upload management (`/api/uploads/*`)

### Socket.IO Events
- Connection lifecycle events
- Player state events
- Playlist state events
- Real-time position updates
- Operation acknowledgments
- NFC session events
- Upload progress events
- YouTube download progress

---

## Future Versions

### [Unreleased]
- TBD

---

## Version Guidelines

### Major Version (Breaking Changes)
- Removing endpoints
- Renaming fields
- Changing data types
- Removing required fields

### Minor Version (Backward Compatible)
- Adding new endpoints
- Adding optional fields
- Adding new Socket.IO events

### Patch Version (Bug Fixes)
- Documentation fixes
- Schema validation fixes
- Generation script improvements
