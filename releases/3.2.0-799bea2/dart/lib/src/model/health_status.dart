//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:tomb_contracts/src/model/health_status_services.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'health_status.g.dart';

/// HealthStatus
///
/// Properties:
/// * [status] 
/// * [services] 
/// * [timestamp] 
/// * [serverSeq] - Server sequence number for state synchronization
@BuiltValue()
abstract class HealthStatus implements Built<HealthStatus, HealthStatusBuilder> {
  @BuiltValueField(wireName: r'status')
  HealthStatusStatusEnum get status;
  // enum statusEnum {  healthy,  degraded,  unhealthy,  };

  @BuiltValueField(wireName: r'services')
  HealthStatusServices get services;

  @BuiltValueField(wireName: r'timestamp')
  num get timestamp;

  /// Server sequence number for state synchronization
  @BuiltValueField(wireName: r'server_seq')
  num get serverSeq;

  HealthStatus._();

  factory HealthStatus([void updates(HealthStatusBuilder b)]) = _$HealthStatus;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HealthStatusBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HealthStatus> get serializer => _$HealthStatusSerializer();
}

class _$HealthStatusSerializer implements PrimitiveSerializer<HealthStatus> {
  @override
  final Iterable<Type> types = const [HealthStatus, _$HealthStatus];

  @override
  final String wireName = r'HealthStatus';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HealthStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(HealthStatusStatusEnum),
    );
    yield r'services';
    yield serializers.serialize(
      object.services,
      specifiedType: const FullType(HealthStatusServices),
    );
    yield r'timestamp';
    yield serializers.serialize(
      object.timestamp,
      specifiedType: const FullType(num),
    );
    yield r'server_seq';
    yield serializers.serialize(
      object.serverSeq,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    HealthStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required HealthStatusBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HealthStatusStatusEnum),
          ) as HealthStatusStatusEnum;
          result.status = valueDes;
          break;
        case r'services':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HealthStatusServices),
          ) as HealthStatusServices;
          result.services.replace(valueDes);
          break;
        case r'timestamp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.timestamp = valueDes;
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
  HealthStatus deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HealthStatusBuilder();
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

class HealthStatusStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'healthy')
  static const HealthStatusStatusEnum healthy = _$healthStatusStatusEnum_healthy;
  @BuiltValueEnumConst(wireName: r'degraded')
  static const HealthStatusStatusEnum degraded = _$healthStatusStatusEnum_degraded;
  @BuiltValueEnumConst(wireName: r'unhealthy')
  static const HealthStatusStatusEnum unhealthy = _$healthStatusStatusEnum_unhealthy;

  static Serializer<HealthStatusStatusEnum> get serializer => _$healthStatusStatusEnumSerializer;

  const HealthStatusStatusEnum._(String name): super(name);

  static BuiltSet<HealthStatusStatusEnum> get values => _$healthStatusStatusEnumValues;
  static HealthStatusStatusEnum valueOf(String name) => _$healthStatusStatusEnumValueOf(name);
}

