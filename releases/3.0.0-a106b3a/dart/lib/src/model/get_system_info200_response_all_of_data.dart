//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:tomb_contracts/src/model/system_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_system_info200_response_all_of_data.g.dart';

/// GetSystemInfo200ResponseAllOfData
///
/// Properties:
/// * [systemInfo] 
/// * [version] 
/// * [hostname] 
/// * [uptime] 
@BuiltValue()
abstract class GetSystemInfo200ResponseAllOfData implements Built<GetSystemInfo200ResponseAllOfData, GetSystemInfo200ResponseAllOfDataBuilder> {
  @BuiltValueField(wireName: r'system_info')
  SystemInfo get systemInfo;

  @BuiltValueField(wireName: r'version')
  String get version;

  @BuiltValueField(wireName: r'hostname')
  String get hostname;

  @BuiltValueField(wireName: r'uptime')
  num get uptime;

  GetSystemInfo200ResponseAllOfData._();

  factory GetSystemInfo200ResponseAllOfData([void updates(GetSystemInfo200ResponseAllOfDataBuilder b)]) = _$GetSystemInfo200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetSystemInfo200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetSystemInfo200ResponseAllOfData> get serializer => _$GetSystemInfo200ResponseAllOfDataSerializer();
}

class _$GetSystemInfo200ResponseAllOfDataSerializer implements PrimitiveSerializer<GetSystemInfo200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [GetSystemInfo200ResponseAllOfData, _$GetSystemInfo200ResponseAllOfData];

  @override
  final String wireName = r'GetSystemInfo200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetSystemInfo200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'system_info';
    yield serializers.serialize(
      object.systemInfo,
      specifiedType: const FullType(SystemInfo),
    );
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(String),
    );
    yield r'hostname';
    yield serializers.serialize(
      object.hostname,
      specifiedType: const FullType(String),
    );
    yield r'uptime';
    yield serializers.serialize(
      object.uptime,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GetSystemInfo200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetSystemInfo200ResponseAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'system_info':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SystemInfo),
          ) as SystemInfo;
          result.systemInfo.replace(valueDes);
          break;
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.version = valueDes;
          break;
        case r'hostname':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.hostname = valueDes;
          break;
        case r'uptime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.uptime = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetSystemInfo200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetSystemInfo200ResponseAllOfDataBuilder();
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

