//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'set_volume200_response_all_of_data.g.dart';

/// SetVolume200ResponseAllOfData
///
/// Properties:
/// * [volume] 
@BuiltValue()
abstract class SetVolume200ResponseAllOfData implements Built<SetVolume200ResponseAllOfData, SetVolume200ResponseAllOfDataBuilder> {
  @BuiltValueField(wireName: r'volume')
  int? get volume;

  SetVolume200ResponseAllOfData._();

  factory SetVolume200ResponseAllOfData([void updates(SetVolume200ResponseAllOfDataBuilder b)]) = _$SetVolume200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SetVolume200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SetVolume200ResponseAllOfData> get serializer => _$SetVolume200ResponseAllOfDataSerializer();
}

class _$SetVolume200ResponseAllOfDataSerializer implements PrimitiveSerializer<SetVolume200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [SetVolume200ResponseAllOfData, _$SetVolume200ResponseAllOfData];

  @override
  final String wireName = r'SetVolume200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SetVolume200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.volume != null) {
      yield r'volume';
      yield serializers.serialize(
        object.volume,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SetVolume200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SetVolume200ResponseAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'volume':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.volume = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SetVolume200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SetVolume200ResponseAllOfDataBuilder();
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

