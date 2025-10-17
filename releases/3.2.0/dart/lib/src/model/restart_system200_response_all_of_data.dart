//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'restart_system200_response_all_of_data.g.dart';

/// RestartSystem200ResponseAllOfData
///
/// Properties:
/// * [restarting] 
@BuiltValue()
abstract class RestartSystem200ResponseAllOfData implements Built<RestartSystem200ResponseAllOfData, RestartSystem200ResponseAllOfDataBuilder> {
  @BuiltValueField(wireName: r'restarting')
  bool? get restarting;

  RestartSystem200ResponseAllOfData._();

  factory RestartSystem200ResponseAllOfData([void updates(RestartSystem200ResponseAllOfDataBuilder b)]) = _$RestartSystem200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RestartSystem200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RestartSystem200ResponseAllOfData> get serializer => _$RestartSystem200ResponseAllOfDataSerializer();
}

class _$RestartSystem200ResponseAllOfDataSerializer implements PrimitiveSerializer<RestartSystem200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [RestartSystem200ResponseAllOfData, _$RestartSystem200ResponseAllOfData];

  @override
  final String wireName = r'RestartSystem200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RestartSystem200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.restarting != null) {
      yield r'restarting';
      yield serializers.serialize(
        object.restarting,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RestartSystem200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RestartSystem200ResponseAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'restarting':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.restarting = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RestartSystem200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RestartSystem200ResponseAllOfDataBuilder();
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

