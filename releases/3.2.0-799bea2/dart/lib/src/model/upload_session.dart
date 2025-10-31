//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upload_session.g.dart';

/// UploadSession
///
/// Properties:
/// * [sessionId] 
/// * [playlistId] 
/// * [filename] 
/// * [fileSize] - Total file size in bytes
/// * [chunkSize] - Size of each chunk in bytes
/// * [totalChunks] - Total number of chunks
/// * [fileHash] - Optional file hash for verification
/// * [createdAt] 
@BuiltValue()
abstract class UploadSession implements Built<UploadSession, UploadSessionBuilder> {
  @BuiltValueField(wireName: r'session_id')
  String get sessionId;

  @BuiltValueField(wireName: r'playlist_id')
  String get playlistId;

  @BuiltValueField(wireName: r'filename')
  String get filename;

  /// Total file size in bytes
  @BuiltValueField(wireName: r'file_size')
  int get fileSize;

  /// Size of each chunk in bytes
  @BuiltValueField(wireName: r'chunk_size')
  int get chunkSize;

  /// Total number of chunks
  @BuiltValueField(wireName: r'total_chunks')
  int get totalChunks;

  /// Optional file hash for verification
  @BuiltValueField(wireName: r'file_hash')
  String? get fileHash;

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  UploadSession._();

  factory UploadSession([void updates(UploadSessionBuilder b)]) = _$UploadSession;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UploadSessionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UploadSession> get serializer => _$UploadSessionSerializer();
}

class _$UploadSessionSerializer implements PrimitiveSerializer<UploadSession> {
  @override
  final Iterable<Type> types = const [UploadSession, _$UploadSession];

  @override
  final String wireName = r'UploadSession';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UploadSession object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'session_id';
    yield serializers.serialize(
      object.sessionId,
      specifiedType: const FullType(String),
    );
    yield r'playlist_id';
    yield serializers.serialize(
      object.playlistId,
      specifiedType: const FullType(String),
    );
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
    yield r'chunk_size';
    yield serializers.serialize(
      object.chunkSize,
      specifiedType: const FullType(int),
    );
    yield r'total_chunks';
    yield serializers.serialize(
      object.totalChunks,
      specifiedType: const FullType(int),
    );
    if (object.fileHash != null) {
      yield r'file_hash';
      yield serializers.serialize(
        object.fileHash,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UploadSession object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UploadSessionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'session_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sessionId = valueDes;
          break;
        case r'playlist_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.playlistId = valueDes;
          break;
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
        case r'total_chunks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalChunks = valueDes;
          break;
        case r'file_hash':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fileHash = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UploadSession deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UploadSessionBuilder();
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

