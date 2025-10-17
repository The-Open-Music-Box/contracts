//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'scan_nfc200_response_all_of_data.g.dart';

/// ScanNFC200ResponseAllOfData
///
/// Properties:
/// * [scanning] 
/// * [sessionId] 
@BuiltValue()
abstract class ScanNFC200ResponseAllOfData implements Built<ScanNFC200ResponseAllOfData, ScanNFC200ResponseAllOfDataBuilder> {
  @BuiltValueField(wireName: r'scanning')
  bool? get scanning;

  @BuiltValueField(wireName: r'session_id')
  String? get sessionId;

  ScanNFC200ResponseAllOfData._();

  factory ScanNFC200ResponseAllOfData([void updates(ScanNFC200ResponseAllOfDataBuilder b)]) = _$ScanNFC200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScanNFC200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScanNFC200ResponseAllOfData> get serializer => _$ScanNFC200ResponseAllOfDataSerializer();
}

class _$ScanNFC200ResponseAllOfDataSerializer implements PrimitiveSerializer<ScanNFC200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [ScanNFC200ResponseAllOfData, _$ScanNFC200ResponseAllOfData];

  @override
  final String wireName = r'ScanNFC200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScanNFC200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.scanning != null) {
      yield r'scanning';
      yield serializers.serialize(
        object.scanning,
        specifiedType: const FullType(bool),
      );
    }
    if (object.sessionId != null) {
      yield r'session_id';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ScanNFC200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ScanNFC200ResponseAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'scanning':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.scanning = valueDes;
          break;
        case r'session_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sessionId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ScanNFC200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScanNFC200ResponseAllOfDataBuilder();
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

