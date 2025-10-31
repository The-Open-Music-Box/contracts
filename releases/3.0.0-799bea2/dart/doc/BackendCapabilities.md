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

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


