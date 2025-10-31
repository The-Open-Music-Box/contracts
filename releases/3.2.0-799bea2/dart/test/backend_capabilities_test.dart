import 'package:test/test.dart';
import 'package:tomb_contracts/tomb_contracts.dart';

// tests for BackendCapabilities
void main() {
  final instance = BackendCapabilitiesBuilder();
  // TODO add properties to the builder and call build()

  group(BackendCapabilities, () {
    // Format supported for audio file chunk uploads: - `raw_binary`: Stream binary data directly (ESP32 - ESPAsyncWebServer body handler) - `multipart`: Multipart form-data with 'file' field (RPI - FastAPI File upload) 
    // String uploadFormat
    test('to test the property `uploadFormat`', () async {
      // TODO
    });

    // Maximum size of a single chunk in bytes. - ESP32: 32768 (32KB) - limited by available heap memory - RPI: 1048576 (1MB) - more resources available 
    // int maxChunkSize
    test('to test the property `maxChunkSize`', () async {
      // TODO
    });

    // If the backend can monitor audio playback position in real-time. - ESP32: false (bandwidth/CPU limited) - RPI: true (sufficient resources) 
    // bool playerMonitoring (default value: true)
    test('to test the property `playerMonitoring`', () async {
      // TODO
    });

    // If NFC reader (PN532) is detected and functional
    // bool nfcAvailable (default value: false)
    test('to test the property `nfcAvailable`', () async {
      // TODO
    });

    // If LED control (strip/hat) is available
    // bool ledControl (default value: false)
    test('to test the property `ledControl`', () async {
      // TODO
    });

  });
}
