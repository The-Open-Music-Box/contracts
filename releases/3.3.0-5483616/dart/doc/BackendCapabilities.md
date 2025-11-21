# tomb_contracts.model.BackendCapabilities

## Load the model package
```dart
import 'package:tomb_contracts/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uploadFormat** | **String** | Format supported for audio file chunk uploads: - `raw_binary`: Stream binary data directly (ESP32 - ESPAsyncWebServer body handler) - `multipart`: Multipart form-data with 'file' field (RPI - FastAPI File upload)  | 
**maxChunkSize** | **int** | Maximum size of a single chunk in bytes. - ESP32: 32768 (32KB) - limited by available heap memory - RPI: 1048576 (1MB) - more resources available  | 
**playerMonitoring** | **bool** | If the backend can monitor audio playback position in real-time. - ESP32: false (bandwidth/CPU limited) - RPI: true (sufficient resources)  | [optional] [default to true]
**nfcAvailable** | **bool** | If NFC reader (PN532) is detected and functional | [optional] [default to false]
**ledControl** | **bool** | If LED control (strip/hat) is available | [optional] [default to false]
**backendType** | **String** | Backend platform identifier for debugging and feature-specific adaptations. - `rpi`: Raspberry Pi backend (Python/FastAPI) - `esp32`: ESP32 firmware backend (C++/Arduino) - `custom`: Custom implementation  | [optional] 
**positionUpdateIntervalMs** | **int** | Recommended position update frequency in milliseconds. Flutter app should use this interval for: - Local interpolation timer frequency - Expected WebSocket event frequency  Typical values: - RPI: 500ms (high-frequency updates) - ESP32: 1000-2000ms (reduced network load)  | [optional] [default to 500]
**supportsWebsocketPosition** | **bool** | If backend can send real-time position updates via WebSocket. If false, Flutter app should fall back to HTTP polling.  Typically true for both RPI and ESP32, but allows future backends to opt out of WebSocket position streaming.  | [optional] [default to true]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


