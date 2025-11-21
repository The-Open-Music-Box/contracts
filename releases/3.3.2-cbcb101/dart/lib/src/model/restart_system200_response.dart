//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:tomb_contracts/src/model/unified_response.dart';
import 'package:tomb_contracts/src/model/unified_response_data.dart';
import 'package:tomb_contracts/src/model/restart_system200_response_all_of_data.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'restart_system200_response.g.dart';

/// RestartSystem200Response
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
abstract class RestartSystem200Response implements UnifiedResponse, Built<RestartSystem200Response, RestartSystem200ResponseBuilder> {
  RestartSystem200Response._();

  factory RestartSystem200Response([void updates(RestartSystem200ResponseBuilder b)]) = _$RestartSystem200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RestartSystem200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RestartSystem200Response> get serializer => _$RestartSystem200ResponseSerializer();
}

class _$RestartSystem200ResponseSerializer implements PrimitiveSerializer<RestartSystem200Response> {
  @override
  final Iterable<Type> types = const [RestartSystem200Response, _$RestartSystem200Response];

  @override
  final String wireName = r'RestartSystem200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RestartSystem200Response object, {
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
    RestartSystem200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RestartSystem200ResponseBuilder result,
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
  RestartSystem200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RestartSystem200ResponseBuilder();
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

class RestartSystem200ResponseStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'success')
  static const RestartSystem200ResponseStatusEnum success = _$restartSystem200ResponseStatusEnum_success;
  @BuiltValueEnumConst(wireName: r'error')
  static const RestartSystem200ResponseStatusEnum error = _$restartSystem200ResponseStatusEnum_error;

  static Serializer<RestartSystem200ResponseStatusEnum> get serializer => _$restartSystem200ResponseStatusEnumSerializer;

  const RestartSystem200ResponseStatusEnum._(String name): super(name);

  static BuiltSet<RestartSystem200ResponseStatusEnum> get values => _$restartSystem200ResponseStatusEnumValues;
  static RestartSystem200ResponseStatusEnum valueOf(String name) => _$restartSystem200ResponseStatusEnumValueOf(name);
}

class RestartSystem200ResponseErrorTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'validation_error')
  static const RestartSystem200ResponseErrorTypeEnum validationError = _$restartSystem200ResponseErrorTypeEnum_validationError;
  @BuiltValueEnumConst(wireName: r'not_found')
  static const RestartSystem200ResponseErrorTypeEnum notFound = _$restartSystem200ResponseErrorTypeEnum_notFound;
  @BuiltValueEnumConst(wireName: r'rate_limit_exceeded')
  static const RestartSystem200ResponseErrorTypeEnum rateLimitExceeded = _$restartSystem200ResponseErrorTypeEnum_rateLimitExceeded;
  @BuiltValueEnumConst(wireName: r'service_unavailable')
  static const RestartSystem200ResponseErrorTypeEnum serviceUnavailable = _$restartSystem200ResponseErrorTypeEnum_serviceUnavailable;
  @BuiltValueEnumConst(wireName: r'internal_error')
  static const RestartSystem200ResponseErrorTypeEnum internalError = _$restartSystem200ResponseErrorTypeEnum_internalError;
  @BuiltValueEnumConst(wireName: r'conflict')
  static const RestartSystem200ResponseErrorTypeEnum conflict = _$restartSystem200ResponseErrorTypeEnum_conflict;
  @BuiltValueEnumConst(wireName: r'bad_request')
  static const RestartSystem200ResponseErrorTypeEnum badRequest = _$restartSystem200ResponseErrorTypeEnum_badRequest;

  static Serializer<RestartSystem200ResponseErrorTypeEnum> get serializer => _$restartSystem200ResponseErrorTypeEnumSerializer;

  const RestartSystem200ResponseErrorTypeEnum._(String name): super(name);

  static BuiltSet<RestartSystem200ResponseErrorTypeEnum> get values => _$restartSystem200ResponseErrorTypeEnumValues;
  static RestartSystem200ResponseErrorTypeEnum valueOf(String name) => _$restartSystem200ResponseErrorTypeEnumValueOf(name);
}

