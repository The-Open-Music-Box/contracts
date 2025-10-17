//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:tomb_contracts/src/model/unified_response.dart';
import 'package:tomb_contracts/src/model/upload_session.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_upload_session201_response.g.dart';

/// InitUploadSession201Response
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
abstract class InitUploadSession201Response implements UnifiedResponse, Built<InitUploadSession201Response, InitUploadSession201ResponseBuilder> {
  InitUploadSession201Response._();

  factory InitUploadSession201Response([void updates(InitUploadSession201ResponseBuilder b)]) = _$InitUploadSession201Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InitUploadSession201ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InitUploadSession201Response> get serializer => _$InitUploadSession201ResponseSerializer();
}

class _$InitUploadSession201ResponseSerializer implements PrimitiveSerializer<InitUploadSession201Response> {
  @override
  final Iterable<Type> types = const [InitUploadSession201Response, _$InitUploadSession201Response];

  @override
  final String wireName = r'InitUploadSession201Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InitUploadSession201Response object, {
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
    InitUploadSession201Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InitUploadSession201ResponseBuilder result,
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
  InitUploadSession201Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InitUploadSession201ResponseBuilder();
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

class InitUploadSession201ResponseStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'success')
  static const InitUploadSession201ResponseStatusEnum success = _$initUploadSession201ResponseStatusEnum_success;
  @BuiltValueEnumConst(wireName: r'error')
  static const InitUploadSession201ResponseStatusEnum error = _$initUploadSession201ResponseStatusEnum_error;

  static Serializer<InitUploadSession201ResponseStatusEnum> get serializer => _$initUploadSession201ResponseStatusEnumSerializer;

  const InitUploadSession201ResponseStatusEnum._(String name): super(name);

  static BuiltSet<InitUploadSession201ResponseStatusEnum> get values => _$initUploadSession201ResponseStatusEnumValues;
  static InitUploadSession201ResponseStatusEnum valueOf(String name) => _$initUploadSession201ResponseStatusEnumValueOf(name);
}

class InitUploadSession201ResponseErrorTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'validation_error')
  static const InitUploadSession201ResponseErrorTypeEnum validationError = _$initUploadSession201ResponseErrorTypeEnum_validationError;
  @BuiltValueEnumConst(wireName: r'not_found')
  static const InitUploadSession201ResponseErrorTypeEnum notFound = _$initUploadSession201ResponseErrorTypeEnum_notFound;
  @BuiltValueEnumConst(wireName: r'rate_limit_exceeded')
  static const InitUploadSession201ResponseErrorTypeEnum rateLimitExceeded = _$initUploadSession201ResponseErrorTypeEnum_rateLimitExceeded;
  @BuiltValueEnumConst(wireName: r'service_unavailable')
  static const InitUploadSession201ResponseErrorTypeEnum serviceUnavailable = _$initUploadSession201ResponseErrorTypeEnum_serviceUnavailable;
  @BuiltValueEnumConst(wireName: r'internal_error')
  static const InitUploadSession201ResponseErrorTypeEnum internalError = _$initUploadSession201ResponseErrorTypeEnum_internalError;
  @BuiltValueEnumConst(wireName: r'conflict')
  static const InitUploadSession201ResponseErrorTypeEnum conflict = _$initUploadSession201ResponseErrorTypeEnum_conflict;
  @BuiltValueEnumConst(wireName: r'bad_request')
  static const InitUploadSession201ResponseErrorTypeEnum badRequest = _$initUploadSession201ResponseErrorTypeEnum_badRequest;

  static Serializer<InitUploadSession201ResponseErrorTypeEnum> get serializer => _$initUploadSession201ResponseErrorTypeEnumSerializer;

  const InitUploadSession201ResponseErrorTypeEnum._(String name): super(name);

  static BuiltSet<InitUploadSession201ResponseErrorTypeEnum> get values => _$initUploadSession201ResponseErrorTypeEnumValues;
  static InitUploadSession201ResponseErrorTypeEnum valueOf(String name) => _$initUploadSession201ResponseErrorTypeEnumValueOf(name);
}

