//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:tomb_contracts/src/model/upload_session_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_upload_sessions200_response_all_of_data.g.dart';

/// ListUploadSessions200ResponseAllOfData
///
/// Properties:
/// * [sessions] 
@BuiltValue()
abstract class ListUploadSessions200ResponseAllOfData implements Built<ListUploadSessions200ResponseAllOfData, ListUploadSessions200ResponseAllOfDataBuilder> {
  @BuiltValueField(wireName: r'sessions')
  BuiltList<UploadSessionStatus>? get sessions;

  ListUploadSessions200ResponseAllOfData._();

  factory ListUploadSessions200ResponseAllOfData([void updates(ListUploadSessions200ResponseAllOfDataBuilder b)]) = _$ListUploadSessions200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ListUploadSessions200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListUploadSessions200ResponseAllOfData> get serializer => _$ListUploadSessions200ResponseAllOfDataSerializer();
}

class _$ListUploadSessions200ResponseAllOfDataSerializer implements PrimitiveSerializer<ListUploadSessions200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [ListUploadSessions200ResponseAllOfData, _$ListUploadSessions200ResponseAllOfData];

  @override
  final String wireName = r'ListUploadSessions200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListUploadSessions200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.sessions != null) {
      yield r'sessions';
      yield serializers.serialize(
        object.sessions,
        specifiedType: const FullType(BuiltList, [FullType(UploadSessionStatus)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ListUploadSessions200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ListUploadSessions200ResponseAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sessions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UploadSessionStatus)]),
          ) as BuiltList<UploadSessionStatus>;
          result.sessions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ListUploadSessions200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListUploadSessions200ResponseAllOfDataBuilder();
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

