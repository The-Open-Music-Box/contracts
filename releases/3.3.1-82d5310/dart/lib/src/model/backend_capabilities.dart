//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'backend_capabilities.g.dart';

/// Backend capability flags that declare what features and formats this backend supports. Allows Flutter app and other clients to auto-configure based on platform constraints. 
///
/// Properties:
/// * [uploadFormat] - Format supported for audio file chunk uploads: - `raw_binary`: Stream binary data directly (ESP32 - ESPAsyncWebServer body handler) - `multipart`: Multipart form-data with 'file' field (RPI - FastAPI File upload) 
/// * [maxChunkSize] - Maximum size of a single chunk in bytes. - ESP32: 32768 (32KB) - limited by available heap memory - RPI: 1048576 (1MB) - more resources available 
/// * [playerMonitoring] - If the backend can monitor audio playback position in real-time. - ESP32: false (bandwidth/CPU limited) - RPI: true (sufficient resources) 
/// * [nfcAvailable] - If NFC reader (PN532) is detected and functional
/// * [ledControl] - If LED control (strip/hat) is available
/// * [backendType] - Backend platform identifier for debugging and feature-specific adaptations. - `rpi`: Raspberry Pi backend (Python/FastAPI) - `esp32`: ESP32 firmware backend (C++/Arduino) - `custom`: Custom implementation 
/// * [positionUpdateIntervalMs] - Recommended position update frequency in milliseconds. Flutter app should use this interval for: - Local interpolation timer frequency - Expected WebSocket event frequency  Typical values: - RPI: 500ms (high-frequency updates) - ESP32: 1000-2000ms (reduced network load) 
/// * [supportsWebsocketPosition] - If backend can send real-time position updates via WebSocket. If false, Flutter app should fall back to HTTP polling.  Typically true for both RPI and ESP32, but allows future backends to opt out of WebSocket position streaming. 
@BuiltValue()
abstract class BackendCapabilities implements Built<BackendCapabilities, BackendCapabilitiesBuilder> {
  /// Format supported for audio file chunk uploads: - `raw_binary`: Stream binary data directly (ESP32 - ESPAsyncWebServer body handler) - `multipart`: Multipart form-data with 'file' field (RPI - FastAPI File upload) 
  @BuiltValueField(wireName: r'upload_format')
  BackendCapabilitiesUploadFormatEnum get uploadFormat;
  // enum uploadFormatEnum {  raw_binary,  multipart,  };

  /// Maximum size of a single chunk in bytes. - ESP32: 32768 (32KB) - limited by available heap memory - RPI: 1048576 (1MB) - more resources available 
  @BuiltValueField(wireName: r'max_chunk_size')
  int get maxChunkSize;

  /// If the backend can monitor audio playback position in real-time. - ESP32: false (bandwidth/CPU limited) - RPI: true (sufficient resources) 
  @BuiltValueField(wireName: r'player_monitoring')
  bool? get playerMonitoring;

  /// If NFC reader (PN532) is detected and functional
  @BuiltValueField(wireName: r'nfc_available')
  bool? get nfcAvailable;

  /// If LED control (strip/hat) is available
  @BuiltValueField(wireName: r'led_control')
  bool? get ledControl;

  /// Backend platform identifier for debugging and feature-specific adaptations. - `rpi`: Raspberry Pi backend (Python/FastAPI) - `esp32`: ESP32 firmware backend (C++/Arduino) - `custom`: Custom implementation 
  @BuiltValueField(wireName: r'backend_type')
  BackendCapabilitiesBackendTypeEnum? get backendType;
  // enum backendTypeEnum {  rpi,  esp32,  custom,  };

  /// Recommended position update frequency in milliseconds. Flutter app should use this interval for: - Local interpolation timer frequency - Expected WebSocket event frequency  Typical values: - RPI: 500ms (high-frequency updates) - ESP32: 1000-2000ms (reduced network load) 
  @BuiltValueField(wireName: r'position_update_interval_ms')
  int? get positionUpdateIntervalMs;

  /// If backend can send real-time position updates via WebSocket. If false, Flutter app should fall back to HTTP polling.  Typically true for both RPI and ESP32, but allows future backends to opt out of WebSocket position streaming. 
  @BuiltValueField(wireName: r'supports_websocket_position')
  bool? get supportsWebsocketPosition;

  BackendCapabilities._();

  factory BackendCapabilities([void updates(BackendCapabilitiesBuilder b)]) = _$BackendCapabilities;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BackendCapabilitiesBuilder b) => b
      ..playerMonitoring = true
      ..nfcAvailable = false
      ..ledControl = false
      ..positionUpdateIntervalMs = 500
      ..supportsWebsocketPosition = true;

  @BuiltValueSerializer(custom: true)
  static Serializer<BackendCapabilities> get serializer => _$BackendCapabilitiesSerializer();
}

class _$BackendCapabilitiesSerializer implements PrimitiveSerializer<BackendCapabilities> {
  @override
  final Iterable<Type> types = const [BackendCapabilities, _$BackendCapabilities];

  @override
  final String wireName = r'BackendCapabilities';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BackendCapabilities object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'upload_format';
    yield serializers.serialize(
      object.uploadFormat,
      specifiedType: const FullType(BackendCapabilitiesUploadFormatEnum),
    );
    yield r'max_chunk_size';
    yield serializers.serialize(
      object.maxChunkSize,
      specifiedType: const FullType(int),
    );
    if (object.playerMonitoring != null) {
      yield r'player_monitoring';
      yield serializers.serialize(
        object.playerMonitoring,
        specifiedType: const FullType(bool),
      );
    }
    if (object.nfcAvailable != null) {
      yield r'nfc_available';
      yield serializers.serialize(
        object.nfcAvailable,
        specifiedType: const FullType(bool),
      );
    }
    if (object.ledControl != null) {
      yield r'led_control';
      yield serializers.serialize(
        object.ledControl,
        specifiedType: const FullType(bool),
      );
    }
    if (object.backendType != null) {
      yield r'backend_type';
      yield serializers.serialize(
        object.backendType,
        specifiedType: const FullType(BackendCapabilitiesBackendTypeEnum),
      );
    }
    if (object.positionUpdateIntervalMs != null) {
      yield r'position_update_interval_ms';
      yield serializers.serialize(
        object.positionUpdateIntervalMs,
        specifiedType: const FullType(int),
      );
    }
    if (object.supportsWebsocketPosition != null) {
      yield r'supports_websocket_position';
      yield serializers.serialize(
        object.supportsWebsocketPosition,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BackendCapabilities object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BackendCapabilitiesBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'upload_format':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BackendCapabilitiesUploadFormatEnum),
          ) as BackendCapabilitiesUploadFormatEnum;
          result.uploadFormat = valueDes;
          break;
        case r'max_chunk_size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxChunkSize = valueDes;
          break;
        case r'player_monitoring':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.playerMonitoring = valueDes;
          break;
        case r'nfc_available':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.nfcAvailable = valueDes;
          break;
        case r'led_control':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.ledControl = valueDes;
          break;
        case r'backend_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BackendCapabilitiesBackendTypeEnum),
          ) as BackendCapabilitiesBackendTypeEnum;
          result.backendType = valueDes;
          break;
        case r'position_update_interval_ms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.positionUpdateIntervalMs = valueDes;
          break;
        case r'supports_websocket_position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.supportsWebsocketPosition = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BackendCapabilities deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BackendCapabilitiesBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

class BackendCapabilitiesUploadFormatEnum extends EnumClass {

  /// Format supported for audio file chunk uploads: - `raw_binary`: Stream binary data directly (ESP32 - ESPAsyncWebServer body handler) - `multipart`: Multipart form-data with 'file' field (RPI - FastAPI File upload) 
  @BuiltValueEnumConst(wireName: r'raw_binary')
  static const BackendCapabilitiesUploadFormatEnum rawBinary = _$backendCapabilitiesUploadFormatEnum_rawBinary;
  /// Format supported for audio file chunk uploads: - `raw_binary`: Stream binary data directly (ESP32 - ESPAsyncWebServer body handler) - `multipart`: Multipart form-data with 'file' field (RPI - FastAPI File upload) 
  @BuiltValueEnumConst(wireName: r'multipart')
  static const BackendCapabilitiesUploadFormatEnum multipart = _$backendCapabilitiesUploadFormatEnum_multipart;

  static Serializer<BackendCapabilitiesUploadFormatEnum> get serializer => _$backendCapabilitiesUploadFormatEnumSerializer;

  const BackendCapabilitiesUploadFormatEnum._(String name): super(name);

  static BuiltSet<BackendCapabilitiesUploadFormatEnum> get values => _$backendCapabilitiesUploadFormatEnumValues;
  static BackendCapabilitiesUploadFormatEnum valueOf(String name) => _$backendCapabilitiesUploadFormatEnumValueOf(name);
}

class BackendCapabilitiesBackendTypeEnum extends EnumClass {

  /// Backend platform identifier for debugging and feature-specific adaptations. - `rpi`: Raspberry Pi backend (Python/FastAPI) - `esp32`: ESP32 firmware backend (C++/Arduino) - `custom`: Custom implementation 
  @BuiltValueEnumConst(wireName: r'rpi')
  static const BackendCapabilitiesBackendTypeEnum rpi = _$backendCapabilitiesBackendTypeEnum_rpi;
  /// Backend platform identifier for debugging and feature-specific adaptations. - `rpi`: Raspberry Pi backend (Python/FastAPI) - `esp32`: ESP32 firmware backend (C++/Arduino) - `custom`: Custom implementation 
  @BuiltValueEnumConst(wireName: r'esp32')
  static const BackendCapabilitiesBackendTypeEnum esp32 = _$backendCapabilitiesBackendTypeEnum_esp32;
  /// Backend platform identifier for debugging and feature-specific adaptations. - `rpi`: Raspberry Pi backend (Python/FastAPI) - `esp32`: ESP32 firmware backend (C++/Arduino) - `custom`: Custom implementation 
  @BuiltValueEnumConst(wireName: r'custom')
  static const BackendCapabilitiesBackendTypeEnum custom = _$backendCapabilitiesBackendTypeEnum_custom;

  static Serializer<BackendCapabilitiesBackendTypeEnum> get serializer => _$backendCapabilitiesBackendTypeEnumSerializer;

  const BackendCapabilitiesBackendTypeEnum._(String name): super(name);

  static BuiltSet<BackendCapabilitiesBackendTypeEnum> get values => _$backendCapabilitiesBackendTypeEnumValues;
  static BackendCapabilitiesBackendTypeEnum valueOf(String name) => _$backendCapabilitiesBackendTypeEnumValueOf(name);
}

