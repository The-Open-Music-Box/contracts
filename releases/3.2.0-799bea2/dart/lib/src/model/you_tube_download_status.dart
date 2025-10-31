//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:tomb_contracts/src/model/track.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'you_tube_download_status.g.dart';

/// YouTubeDownloadStatus
///
/// Properties:
/// * [taskId] 
/// * [status] 
/// * [progress] 
/// * [error] 
/// * [track] 
@BuiltValue()
abstract class YouTubeDownloadStatus implements Built<YouTubeDownloadStatus, YouTubeDownloadStatusBuilder> {
  @BuiltValueField(wireName: r'task_id')
  String get taskId;

  @BuiltValueField(wireName: r'status')
  YouTubeDownloadStatusStatusEnum get status;
  // enum statusEnum {  pending,  downloading,  processing,  completed,  failed,  };

  @BuiltValueField(wireName: r'progress')
  num? get progress;

  @BuiltValueField(wireName: r'error')
  String? get error;

  @BuiltValueField(wireName: r'track')
  Track? get track;

  YouTubeDownloadStatus._();

  factory YouTubeDownloadStatus([void updates(YouTubeDownloadStatusBuilder b)]) = _$YouTubeDownloadStatus;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(YouTubeDownloadStatusBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<YouTubeDownloadStatus> get serializer => _$YouTubeDownloadStatusSerializer();
}

class _$YouTubeDownloadStatusSerializer implements PrimitiveSerializer<YouTubeDownloadStatus> {
  @override
  final Iterable<Type> types = const [YouTubeDownloadStatus, _$YouTubeDownloadStatus];

  @override
  final String wireName = r'YouTubeDownloadStatus';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    YouTubeDownloadStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'task_id';
    yield serializers.serialize(
      object.taskId,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(YouTubeDownloadStatusStatusEnum),
    );
    if (object.progress != null) {
      yield r'progress';
      yield serializers.serialize(
        object.progress,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.error != null) {
      yield r'error';
      yield serializers.serialize(
        object.error,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.track != null) {
      yield r'track';
      yield serializers.serialize(
        object.track,
        specifiedType: const FullType.nullable(Track),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    YouTubeDownloadStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required YouTubeDownloadStatusBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'task_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.taskId = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(YouTubeDownloadStatusStatusEnum),
          ) as YouTubeDownloadStatusStatusEnum;
          result.status = valueDes;
          break;
        case r'progress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.progress = valueDes;
          break;
        case r'error':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.error = valueDes;
          break;
        case r'track':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Track),
          ) as Track?;
          if (valueDes == null) continue;
          result.track.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  YouTubeDownloadStatus deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = YouTubeDownloadStatusBuilder();
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

class YouTubeDownloadStatusStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'pending')
  static const YouTubeDownloadStatusStatusEnum pending = _$youTubeDownloadStatusStatusEnum_pending;
  @BuiltValueEnumConst(wireName: r'downloading')
  static const YouTubeDownloadStatusStatusEnum downloading = _$youTubeDownloadStatusStatusEnum_downloading;
  @BuiltValueEnumConst(wireName: r'processing')
  static const YouTubeDownloadStatusStatusEnum processing = _$youTubeDownloadStatusStatusEnum_processing;
  @BuiltValueEnumConst(wireName: r'completed')
  static const YouTubeDownloadStatusStatusEnum completed = _$youTubeDownloadStatusStatusEnum_completed;
  @BuiltValueEnumConst(wireName: r'failed')
  static const YouTubeDownloadStatusStatusEnum failed = _$youTubeDownloadStatusStatusEnum_failed;

  static Serializer<YouTubeDownloadStatusStatusEnum> get serializer => _$youTubeDownloadStatusStatusEnumSerializer;

  const YouTubeDownloadStatusStatusEnum._(String name): super(name);

  static BuiltSet<YouTubeDownloadStatusStatusEnum> get values => _$youTubeDownloadStatusStatusEnumValues;
  static YouTubeDownloadStatusStatusEnum valueOf(String name) => _$youTubeDownloadStatusStatusEnumValueOf(name);
}

