//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upload_session_status.g.dart';

/// UploadSessionStatus
///
/// Properties:
/// * [sessionId] 
/// * [filename] 
/// * [fileSize] 
/// * [chunksUploaded] 
/// * [chunksTotal] 
/// * [progressPercent] 
/// * [playlistId] 
/// * [createdAt] 
/// * [status] 
@BuiltValue()
abstract class UploadSessionStatus implements Built<UploadSessionStatus, UploadSessionStatusBuilder> {
  @BuiltValueField(wireName: r'session_id')
  String get sessionId;

  @BuiltValueField(wireName: r'filename')
  String get filename;

  @BuiltValueField(wireName: r'file_size')
  int get fileSize;

  @BuiltValueField(wireName: r'chunks_uploaded')
  int get chunksUploaded;

  @BuiltValueField(wireName: r'chunks_total')
  int get chunksTotal;

  @BuiltValueField(wireName: r'progress_percent')
  num get progressPercent;

  @BuiltValueField(wireName: r'playlist_id')
  String? get playlistId;

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'status')
  UploadSessionStatusStatusEnum get status;
  // enum statusEnum {  pending,  uploading,  completed,  error,  };

  UploadSessionStatus._();

  factory UploadSessionStatus([void updates(UploadSessionStatusBuilder b)]) = _$UploadSessionStatus;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UploadSessionStatusBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UploadSessionStatus> get serializer => _$UploadSessionStatusSerializer();
}

class _$UploadSessionStatusSerializer implements PrimitiveSerializer<UploadSessionStatus> {
  @override
  final Iterable<Type> types = const [UploadSessionStatus, _$UploadSessionStatus];

  @override
  final String wireName = r'UploadSessionStatus';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UploadSessionStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'session_id';
    yield serializers.serialize(
      object.sessionId,
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
    yield r'chunks_uploaded';
    yield serializers.serialize(
      object.chunksUploaded,
      specifiedType: const FullType(int),
    );
    yield r'chunks_total';
    yield serializers.serialize(
      object.chunksTotal,
      specifiedType: const FullType(int),
    );
    yield r'progress_percent';
    yield serializers.serialize(
      object.progressPercent,
      specifiedType: const FullType(num),
    );
    if (object.playlistId != null) {
      yield r'playlist_id';
      yield serializers.serialize(
        object.playlistId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(UploadSessionStatusStatusEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UploadSessionStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UploadSessionStatusBuilder result,
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
        case r'chunks_uploaded':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.chunksUploaded = valueDes;
          break;
        case r'chunks_total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.chunksTotal = valueDes;
          break;
        case r'progress_percent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.progressPercent = valueDes;
          break;
        case r'playlist_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.playlistId = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UploadSessionStatusStatusEnum),
          ) as UploadSessionStatusStatusEnum;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UploadSessionStatus deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UploadSessionStatusBuilder();
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

class UploadSessionStatusStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'pending')
  static const UploadSessionStatusStatusEnum pending = _$uploadSessionStatusStatusEnum_pending;
  @BuiltValueEnumConst(wireName: r'uploading')
  static const UploadSessionStatusStatusEnum uploading = _$uploadSessionStatusStatusEnum_uploading;
  @BuiltValueEnumConst(wireName: r'completed')
  static const UploadSessionStatusStatusEnum completed = _$uploadSessionStatusStatusEnum_completed;
  @BuiltValueEnumConst(wireName: r'error')
  static const UploadSessionStatusStatusEnum error = _$uploadSessionStatusStatusEnum_error;

  static Serializer<UploadSessionStatusStatusEnum> get serializer => _$uploadSessionStatusStatusEnumSerializer;

  const UploadSessionStatusStatusEnum._(String name): super(name);

  static BuiltSet<UploadSessionStatusStatusEnum> get values => _$uploadSessionStatusStatusEnumValues;
  static UploadSessionStatusStatusEnum valueOf(String name) => _$uploadSessionStatusStatusEnumValueOf(name);
}

