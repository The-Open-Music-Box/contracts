//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_upload_session_request.g.dart';

/// InitUploadSessionRequest
///
/// Properties:
/// * [filename] 
/// * [fileSize] - Total file size in bytes
/// * [chunkSize] - Chunk size in bytes (default 1MB)
/// * [fileHash] 
@BuiltValue()
abstract class InitUploadSessionRequest implements Built<InitUploadSessionRequest, InitUploadSessionRequestBuilder> {
  @BuiltValueField(wireName: r'filename')
  String get filename;

  /// Total file size in bytes
  @BuiltValueField(wireName: r'file_size')
  int get fileSize;

  /// Chunk size in bytes (default 1MB)
  @BuiltValueField(wireName: r'chunk_size')
  int? get chunkSize;

  @BuiltValueField(wireName: r'file_hash')
  String? get fileHash;

  InitUploadSessionRequest._();

  factory InitUploadSessionRequest([void updates(InitUploadSessionRequestBuilder b)]) = _$InitUploadSessionRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InitUploadSessionRequestBuilder b) => b
      ..chunkSize = 1048576;

  @BuiltValueSerializer(custom: true)
  static Serializer<InitUploadSessionRequest> get serializer => _$InitUploadSessionRequestSerializer();
}

class _$InitUploadSessionRequestSerializer implements PrimitiveSerializer<InitUploadSessionRequest> {
  @override
  final Iterable<Type> types = const [InitUploadSessionRequest, _$InitUploadSessionRequest];

  @override
  final String wireName = r'InitUploadSessionRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InitUploadSessionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'filename';
    yield serializers.serialize(
      object.filename,
      specifiedType: const FullType(String),
    );
    yield r'file_size';
    yield serializers.serialize(
      object.fileSize,
      specifiedType: const FullType(int),
    );
    if (object.chunkSize != null) {
      yield r'chunk_size';
      yield serializers.serialize(
        object.chunkSize,
        specifiedType: const FullType(int),
      );
    }
    if (object.fileHash != null) {
      yield r'file_hash';
      yield serializers.serialize(
        object.fileHash,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InitUploadSessionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InitUploadSessionRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filename':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.filename = valueDes;
          break;
        case r'file_size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.fileSize = valueDes;
          break;
        case r'chunk_size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.chunkSize = valueDes;
          break;
        case r'file_hash':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fileHash = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InitUploadSessionRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InitUploadSessionRequestBuilder();
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

