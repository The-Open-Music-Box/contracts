//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_you_tube200_response_all_of_data.g.dart';

/// DownloadYouTube200ResponseAllOfData
///
/// Properties:
/// * [taskId] 
/// * [status] 
@BuiltValue()
abstract class DownloadYouTube200ResponseAllOfData implements Built<DownloadYouTube200ResponseAllOfData, DownloadYouTube200ResponseAllOfDataBuilder> {
  @BuiltValueField(wireName: r'task_id')
  String? get taskId;

  @BuiltValueField(wireName: r'status')
  String? get status;

  DownloadYouTube200ResponseAllOfData._();

  factory DownloadYouTube200ResponseAllOfData([void updates(DownloadYouTube200ResponseAllOfDataBuilder b)]) = _$DownloadYouTube200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DownloadYouTube200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DownloadYouTube200ResponseAllOfData> get serializer => _$DownloadYouTube200ResponseAllOfDataSerializer();
}

class _$DownloadYouTube200ResponseAllOfDataSerializer implements PrimitiveSerializer<DownloadYouTube200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [DownloadYouTube200ResponseAllOfData, _$DownloadYouTube200ResponseAllOfData];

  @override
  final String wireName = r'DownloadYouTube200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DownloadYouTube200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.taskId != null) {
      yield r'task_id';
      yield serializers.serialize(
        object.taskId,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DownloadYouTube200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DownloadYouTube200ResponseAllOfDataBuilder result,
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
            specifiedType: const FullType(String),
          ) as String;
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
  DownloadYouTube200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DownloadYouTube200ResponseAllOfDataBuilder();
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

