//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_nfc_status200_response_all_of_data.g.dart';

/// GetNFCStatus200ResponseAllOfData
///
/// Properties:
/// * [readerAvailable] 
/// * [scanning] 
/// * [associationActive] 
/// * [currentSessionId] 
/// * [activeSessions] 
@BuiltValue()
abstract class GetNFCStatus200ResponseAllOfData implements Built<GetNFCStatus200ResponseAllOfData, GetNFCStatus200ResponseAllOfDataBuilder> {
  @BuiltValueField(wireName: r'reader_available')
  bool get readerAvailable;

  @BuiltValueField(wireName: r'scanning')
  bool get scanning;

  @BuiltValueField(wireName: r'association_active')
  bool get associationActive;

  @BuiltValueField(wireName: r'current_session_id')
  String? get currentSessionId;

  @BuiltValueField(wireName: r'active_sessions')
  BuiltList<String> get activeSessions;

  GetNFCStatus200ResponseAllOfData._();

  factory GetNFCStatus200ResponseAllOfData([void updates(GetNFCStatus200ResponseAllOfDataBuilder b)]) = _$GetNFCStatus200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetNFCStatus200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetNFCStatus200ResponseAllOfData> get serializer => _$GetNFCStatus200ResponseAllOfDataSerializer();
}

class _$GetNFCStatus200ResponseAllOfDataSerializer implements PrimitiveSerializer<GetNFCStatus200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [GetNFCStatus200ResponseAllOfData, _$GetNFCStatus200ResponseAllOfData];

  @override
  final String wireName = r'GetNFCStatus200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetNFCStatus200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'reader_available';
    yield serializers.serialize(
      object.readerAvailable,
      specifiedType: const FullType(bool),
    );
    yield r'scanning';
    yield serializers.serialize(
      object.scanning,
      specifiedType: const FullType(bool),
    );
    yield r'association_active';
    yield serializers.serialize(
      object.associationActive,
      specifiedType: const FullType(bool),
    );
    if (object.currentSessionId != null) {
      yield r'current_session_id';
      yield serializers.serialize(
        object.currentSessionId,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'active_sessions';
    yield serializers.serialize(
      object.activeSessions,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GetNFCStatus200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetNFCStatus200ResponseAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'reader_available':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.readerAvailable = valueDes;
          break;
        case r'scanning':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.scanning = valueDes;
          break;
        case r'association_active':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.associationActive = valueDes;
          break;
        case r'current_session_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currentSessionId = valueDes;
          break;
        case r'active_sessions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.activeSessions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetNFCStatus200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetNFCStatus200ResponseAllOfDataBuilder();
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

