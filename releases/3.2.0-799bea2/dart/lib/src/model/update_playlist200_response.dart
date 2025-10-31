//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:tomb_contracts/src/model/player_play_request.dart';
import 'package:built_collection/built_collection.dart';
import 'package:tomb_contracts/src/model/unified_response.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_playlist200_response.g.dart';

/// UpdatePlaylist200Response
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
abstract class UpdatePlaylist200Response implements UnifiedResponse, Built<UpdatePlaylist200Response, UpdatePlaylist200ResponseBuilder> {
  UpdatePlaylist200Response._();

  factory UpdatePlaylist200Response([void updates(UpdatePlaylist200ResponseBuilder b)]) = _$UpdatePlaylist200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdatePlaylist200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdatePlaylist200Response> get serializer => _$UpdatePlaylist200ResponseSerializer();
}

class _$UpdatePlaylist200ResponseSerializer implements PrimitiveSerializer<UpdatePlaylist200Response> {
  @override
  final Iterable<Type> types = const [UpdatePlaylist200Response, _$UpdatePlaylist200Response];

  @override
  final String wireName = r'UpdatePlaylist200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdatePlaylist200Response object, {
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
    UpdatePlaylist200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdatePlaylist200ResponseBuilder result,
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
  UpdatePlaylist200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdatePlaylist200ResponseBuilder();
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

class UpdatePlaylist200ResponseStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'success')
  static const UpdatePlaylist200ResponseStatusEnum success = _$updatePlaylist200ResponseStatusEnum_success;
  @BuiltValueEnumConst(wireName: r'error')
  static const UpdatePlaylist200ResponseStatusEnum error = _$updatePlaylist200ResponseStatusEnum_error;

  static Serializer<UpdatePlaylist200ResponseStatusEnum> get serializer => _$updatePlaylist200ResponseStatusEnumSerializer;

  const UpdatePlaylist200ResponseStatusEnum._(String name): super(name);

  static BuiltSet<UpdatePlaylist200ResponseStatusEnum> get values => _$updatePlaylist200ResponseStatusEnumValues;
  static UpdatePlaylist200ResponseStatusEnum valueOf(String name) => _$updatePlaylist200ResponseStatusEnumValueOf(name);
}

class UpdatePlaylist200ResponseErrorTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'validation_error')
  static const UpdatePlaylist200ResponseErrorTypeEnum validationError = _$updatePlaylist200ResponseErrorTypeEnum_validationError;
  @BuiltValueEnumConst(wireName: r'not_found')
  static const UpdatePlaylist200ResponseErrorTypeEnum notFound = _$updatePlaylist200ResponseErrorTypeEnum_notFound;
  @BuiltValueEnumConst(wireName: r'rate_limit_exceeded')
  static const UpdatePlaylist200ResponseErrorTypeEnum rateLimitExceeded = _$updatePlaylist200ResponseErrorTypeEnum_rateLimitExceeded;
  @BuiltValueEnumConst(wireName: r'service_unavailable')
  static const UpdatePlaylist200ResponseErrorTypeEnum serviceUnavailable = _$updatePlaylist200ResponseErrorTypeEnum_serviceUnavailable;
  @BuiltValueEnumConst(wireName: r'internal_error')
  static const UpdatePlaylist200ResponseErrorTypeEnum internalError = _$updatePlaylist200ResponseErrorTypeEnum_internalError;
  @BuiltValueEnumConst(wireName: r'conflict')
  static const UpdatePlaylist200ResponseErrorTypeEnum conflict = _$updatePlaylist200ResponseErrorTypeEnum_conflict;
  @BuiltValueEnumConst(wireName: r'bad_request')
  static const UpdatePlaylist200ResponseErrorTypeEnum badRequest = _$updatePlaylist200ResponseErrorTypeEnum_badRequest;

  static Serializer<UpdatePlaylist200ResponseErrorTypeEnum> get serializer => _$updatePlaylist200ResponseErrorTypeEnumSerializer;

  const UpdatePlaylist200ResponseErrorTypeEnum._(String name): super(name);

  static BuiltSet<UpdatePlaylist200ResponseErrorTypeEnum> get values => _$updatePlaylist200ResponseErrorTypeEnumValues;
  static UpdatePlaylist200ResponseErrorTypeEnum valueOf(String name) => _$updatePlaylist200ResponseErrorTypeEnumValueOf(name);
}

