//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'system_info.g.dart';

/// SystemInfo
///
/// Properties:
/// * [platform] 
/// * [platformRelease] 
/// * [platformVersion] 
/// * [architecture] 
/// * [hostname] 
/// * [processor] 
/// * [memoryTotal] 
/// * [memoryAvailable] 
/// * [memoryPercent] 
/// * [serverSeq] - Server sequence number for state synchronization
@BuiltValue()
abstract class SystemInfo implements Built<SystemInfo, SystemInfoBuilder> {
  @BuiltValueField(wireName: r'platform')
  String get platform;

  @BuiltValueField(wireName: r'platform_release')
  String get platformRelease;

  @BuiltValueField(wireName: r'platform_version')
  String get platformVersion;

  @BuiltValueField(wireName: r'architecture')
  String get architecture;

  @BuiltValueField(wireName: r'hostname')
  String get hostname;

  @BuiltValueField(wireName: r'processor')
  String get processor;

  @BuiltValueField(wireName: r'memory_total')
  int? get memoryTotal;

  @BuiltValueField(wireName: r'memory_available')
  int? get memoryAvailable;

  @BuiltValueField(wireName: r'memory_percent')
  num? get memoryPercent;

  /// Server sequence number for state synchronization
  @BuiltValueField(wireName: r'server_seq')
  num get serverSeq;

  SystemInfo._();

  factory SystemInfo([void updates(SystemInfoBuilder b)]) = _$SystemInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SystemInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SystemInfo> get serializer => _$SystemInfoSerializer();
}

class _$SystemInfoSerializer implements PrimitiveSerializer<SystemInfo> {
  @override
  final Iterable<Type> types = const [SystemInfo, _$SystemInfo];

  @override
  final String wireName = r'SystemInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SystemInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'platform';
    yield serializers.serialize(
      object.platform,
      specifiedType: const FullType(String),
    );
    yield r'platform_release';
    yield serializers.serialize(
      object.platformRelease,
      specifiedType: const FullType(String),
    );
    yield r'platform_version';
    yield serializers.serialize(
      object.platformVersion,
      specifiedType: const FullType(String),
    );
    yield r'architecture';
    yield serializers.serialize(
      object.architecture,
      specifiedType: const FullType(String),
    );
    yield r'hostname';
    yield serializers.serialize(
      object.hostname,
      specifiedType: const FullType(String),
    );
    yield r'processor';
    yield serializers.serialize(
      object.processor,
      specifiedType: const FullType(String),
    );
    if (object.memoryTotal != null) {
      yield r'memory_total';
      yield serializers.serialize(
        object.memoryTotal,
        specifiedType: const FullType(int),
      );
    }
    if (object.memoryAvailable != null) {
      yield r'memory_available';
      yield serializers.serialize(
        object.memoryAvailable,
        specifiedType: const FullType(int),
      );
    }
    if (object.memoryPercent != null) {
      yield r'memory_percent';
      yield serializers.serialize(
        object.memoryPercent,
        specifiedType: const FullType(num),
      );
    }
    yield r'server_seq';
    yield serializers.serialize(
      object.serverSeq,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SystemInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SystemInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'platform':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.platform = valueDes;
          break;
        case r'platform_release':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.platformRelease = valueDes;
          break;
        case r'platform_version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.platformVersion = valueDes;
          break;
        case r'architecture':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.architecture = valueDes;
          break;
        case r'hostname':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.hostname = valueDes;
          break;
        case r'processor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.processor = valueDes;
          break;
        case r'memory_total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.memoryTotal = valueDes;
          break;
        case r'memory_available':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.memoryAvailable = valueDes;
          break;
        case r'memory_percent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.memoryPercent = valueDes;
          break;
        case r'server_seq':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.serverSeq = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SystemInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SystemInfoBuilder();
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

