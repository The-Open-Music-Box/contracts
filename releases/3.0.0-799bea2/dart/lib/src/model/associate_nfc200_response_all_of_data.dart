//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:tomb_contracts/src/model/nfc_association.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'associate_nfc200_response_all_of_data.g.dart';

/// AssociateNFC200ResponseAllOfData
///
/// Properties:
/// * [association] 
@BuiltValue()
abstract class AssociateNFC200ResponseAllOfData implements Built<AssociateNFC200ResponseAllOfData, AssociateNFC200ResponseAllOfDataBuilder> {
  @BuiltValueField(wireName: r'association')
  NFCAssociation? get association;

  AssociateNFC200ResponseAllOfData._();

  factory AssociateNFC200ResponseAllOfData([void updates(AssociateNFC200ResponseAllOfDataBuilder b)]) = _$AssociateNFC200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AssociateNFC200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AssociateNFC200ResponseAllOfData> get serializer => _$AssociateNFC200ResponseAllOfDataSerializer();
}

class _$AssociateNFC200ResponseAllOfDataSerializer implements PrimitiveSerializer<AssociateNFC200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [AssociateNFC200ResponseAllOfData, _$AssociateNFC200ResponseAllOfData];

  @override
  final String wireName = r'AssociateNFC200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AssociateNFC200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.association != null) {
      yield r'association';
      yield serializers.serialize(
        object.association,
        specifiedType: const FullType(NFCAssociation),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AssociateNFC200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AssociateNFC200ResponseAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'association':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(NFCAssociation),
          ) as NFCAssociation;
          result.association.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AssociateNFC200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AssociateNFC200ResponseAllOfDataBuilder();
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

