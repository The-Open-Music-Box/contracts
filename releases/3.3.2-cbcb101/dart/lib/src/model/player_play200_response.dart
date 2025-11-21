//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:tomb_contracts/src/model/player_state.dart';
import 'package:built_collection/built_collection.dart';
import 'package:tomb_contracts/src/model/unified_response.dart';
import 'package:tomb_contracts/src/model/unified_response_data.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'player_play200_response.g.dart';

/// PlayerPlay200Response
///
/// Properties:
/// * [status] 
/// * [message] 
/// * [data] 
/// * [clientOpId] - Client operation ID for operation tracking
/// * [serverSeq] - Server sequence number for state synchronization
/// * [timestamp] - Unix timestamp in seconds
/// * [requestId] 
/// * [errorType] 
/// * [details] 
@BuiltValue()
abstract class PlayerPlay200Response implements UnifiedResponse, Built<PlayerPlay200Response, PlayerPlay200ResponseBuilder> {
  PlayerPlay200Response._();

  factory PlayerPlay200Response([void updates(PlayerPlay200ResponseBuilder b)]) = _$PlayerPlay200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PlayerPlay200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PlayerPlay200Response> get serializer => _$PlayerPlay200ResponseSerializer();
}

class _$PlayerPlay200ResponseSerializer implements PrimitiveSerializer<PlayerPlay200Response> {
  @override
  final Iterable<Type> types = const [PlayerPlay200Response, _$PlayerPlay200Response];

  @override
  final String wireName = r'PlayerPlay200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PlayerPlay200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType.nullable(UnifiedResponseData),
      );
    }
    if (object.clientOpId != null) {
      yield r'client_op_id';
      yield serializers.serialize(
        object.clientOpId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.requestId != null) {
      yield r'request_id';
      yield serializers.serialize(
        object.requestId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.errorType != null) {
      yield r'error_type';
      yield serializers.serialize(
        object.errorType,
        specifiedType: const FullType.nullable(UnifiedResponseErrorTypeEnum),
      );
    }
    if (object.serverSeq != null) {
      yield r'server_seq';
      yield serializers.serialize(
        object.serverSeq,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.details != null) {
      yield r'details';
      yield serializers.serialize(
        object.details,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(UnifiedResponseStatusEnum),
    );
    yield r'timestamp';
    yield serializers.serialize(
      object.timestamp,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PlayerPlay200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PlayerPlay200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(UnifiedResponseData),
          ) as UnifiedResponseData?;
          if (valueDes == null) continue;
          result.data.replace(valueDes);
          break;
        case r'client_op_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.clientOpId = valueDes;
          break;
        case r'request_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.requestId = valueDes;
          break;
        case r'error_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(UnifiedResponseErrorTypeEnum),
          ) as UnifiedResponseErrorTypeEnum?;
          if (valueDes == null) continue;
          result.errorType = valueDes;
          break;
        case r'server_seq':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.serverSeq = valueDes;
          break;
        case r'details':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>?;
          if (valueDes == null) continue;
          result.details.replace(valueDes);
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UnifiedResponseStatusEnum),
          ) as UnifiedResponseStatusEnum;
          result.status = valueDes;
          break;
        case r'timestamp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.timestamp = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PlayerPlay200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PlayerPlay200ResponseBuilder();
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

class PlayerPlay200ResponseStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'success')
  static const PlayerPlay200ResponseStatusEnum success = _$playerPlay200ResponseStatusEnum_success;
  @BuiltValueEnumConst(wireName: r'error')
  static const PlayerPlay200ResponseStatusEnum error = _$playerPlay200ResponseStatusEnum_error;

  static Serializer<PlayerPlay200ResponseStatusEnum> get serializer => _$playerPlay200ResponseStatusEnumSerializer;

  const PlayerPlay200ResponseStatusEnum._(String name): super(name);

  static BuiltSet<PlayerPlay200ResponseStatusEnum> get values => _$playerPlay200ResponseStatusEnumValues;
  static PlayerPlay200ResponseStatusEnum valueOf(String name) => _$playerPlay200ResponseStatusEnumValueOf(name);
}

class PlayerPlay200ResponseErrorTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'validation_error')
  static const PlayerPlay200ResponseErrorTypeEnum validationError = _$playerPlay200ResponseErrorTypeEnum_validationError;
  @BuiltValueEnumConst(wireName: r'not_found')
  static const PlayerPlay200ResponseErrorTypeEnum notFound = _$playerPlay200ResponseErrorTypeEnum_notFound;
  @BuiltValueEnumConst(wireName: r'rate_limit_exceeded')
  static const PlayerPlay200ResponseErrorTypeEnum rateLimitExceeded = _$playerPlay200ResponseErrorTypeEnum_rateLimitExceeded;
  @BuiltValueEnumConst(wireName: r'service_unavailable')
  static const PlayerPlay200ResponseErrorTypeEnum serviceUnavailable = _$playerPlay200ResponseErrorTypeEnum_serviceUnavailable;
  @BuiltValueEnumConst(wireName: r'internal_error')
  static const PlayerPlay200ResponseErrorTypeEnum internalError = _$playerPlay200ResponseErrorTypeEnum_internalError;
  @BuiltValueEnumConst(wireName: r'conflict')
  static const PlayerPlay200ResponseErrorTypeEnum conflict = _$playerPlay200ResponseErrorTypeEnum_conflict;
  @BuiltValueEnumConst(wireName: r'bad_request')
  static const PlayerPlay200ResponseErrorTypeEnum badRequest = _$playerPlay200ResponseErrorTypeEnum_badRequest;

  static Serializer<PlayerPlay200ResponseErrorTypeEnum> get serializer => _$playerPlay200ResponseErrorTypeEnumSerializer;

  const PlayerPlay200ResponseErrorTypeEnum._(String name): super(name);

  static BuiltSet<PlayerPlay200ResponseErrorTypeEnum> get values => _$playerPlay200ResponseErrorTypeEnumValues;
  static PlayerPlay200ResponseErrorTypeEnum valueOf(String name) => _$playerPlay200ResponseErrorTypeEnumValueOf(name);
}

