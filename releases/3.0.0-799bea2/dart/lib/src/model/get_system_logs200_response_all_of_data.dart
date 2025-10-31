//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_system_logs200_response_all_of_data.g.dart';

/// GetSystemLogs200ResponseAllOfData
///
/// Properties:
/// * [logs] 
@BuiltValue()
abstract class GetSystemLogs200ResponseAllOfData implements Built<GetSystemLogs200ResponseAllOfData, GetSystemLogs200ResponseAllOfDataBuilder> {
  @BuiltValueField(wireName: r'logs')
  BuiltList<String>? get logs;

  GetSystemLogs200ResponseAllOfData._();

  factory GetSystemLogs200ResponseAllOfData([void updates(GetSystemLogs200ResponseAllOfDataBuilder b)]) = _$GetSystemLogs200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetSystemLogs200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetSystemLogs200ResponseAllOfData> get serializer => _$GetSystemLogs200ResponseAllOfDataSerializer();
}

class _$GetSystemLogs200ResponseAllOfDataSerializer implements PrimitiveSerializer<GetSystemLogs200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [GetSystemLogs200ResponseAllOfData, _$GetSystemLogs200ResponseAllOfData];

  @override
  final String wireName = r'GetSystemLogs200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetSystemLogs200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.logs != null) {
      yield r'logs';
      yield serializers.serialize(
        object.logs,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetSystemLogs200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetSystemLogs200ResponseAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'logs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.logs.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetSystemLogs200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetSystemLogs200ResponseAllOfDataBuilder();
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

