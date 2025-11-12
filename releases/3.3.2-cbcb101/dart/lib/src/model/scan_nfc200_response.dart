//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:tomb_contracts/src/model/scan_nfc200_response_all_of_data.dart';
import 'package:built_collection/built_collection.dart';
import 'package:tomb_contracts/src/model/unified_response.dart';
import 'package:tomb_contracts/src/model/unified_response_data.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'scan_nfc200_response.g.dart';

/// ScanNFC200Response
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
abstract class ScanNFC200Response implements UnifiedResponse, Built<ScanNFC200Response, ScanNFC200ResponseBuilder> {
  ScanNFC200Response._();

  factory ScanNFC200Response([void updates(ScanNFC200ResponseBuilder b)]) = _$ScanNFC200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScanNFC200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScanNFC200Response> get serializer => _$ScanNFC200ResponseSerializer();
}

class _$ScanNFC200ResponseSerializer implements PrimitiveSerializer<ScanNFC200Response> {
  @override
  final Iterable<Type> types = const [ScanNFC200Response, _$ScanNFC200Response];

  @override
  final String wireName = r'ScanNFC200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScanNFC200Response object, {
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
    ScanNFC200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ScanNFC200ResponseBuilder result,
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
  ScanNFC200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScanNFC200ResponseBuilder();
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

class ScanNFC200ResponseStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'success')
  static const ScanNFC200ResponseStatusEnum success = _$scanNFC200ResponseStatusEnum_success;
  @BuiltValueEnumConst(wireName: r'error')
  static const ScanNFC200ResponseStatusEnum error = _$scanNFC200ResponseStatusEnum_error;

  static Serializer<ScanNFC200ResponseStatusEnum> get serializer => _$scanNFC200ResponseStatusEnumSerializer;

  const ScanNFC200ResponseStatusEnum._(String name): super(name);

  static BuiltSet<ScanNFC200ResponseStatusEnum> get values => _$scanNFC200ResponseStatusEnumValues;
  static ScanNFC200ResponseStatusEnum valueOf(String name) => _$scanNFC200ResponseStatusEnumValueOf(name);
}

class ScanNFC200ResponseErrorTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'validation_error')
  static const ScanNFC200ResponseErrorTypeEnum validationError = _$scanNFC200ResponseErrorTypeEnum_validationError;
  @BuiltValueEnumConst(wireName: r'not_found')
  static const ScanNFC200ResponseErrorTypeEnum notFound = _$scanNFC200ResponseErrorTypeEnum_notFound;
  @BuiltValueEnumConst(wireName: r'rate_limit_exceeded')
  static const ScanNFC200ResponseErrorTypeEnum rateLimitExceeded = _$scanNFC200ResponseErrorTypeEnum_rateLimitExceeded;
  @BuiltValueEnumConst(wireName: r'service_unavailable')
  static const ScanNFC200ResponseErrorTypeEnum serviceUnavailable = _$scanNFC200ResponseErrorTypeEnum_serviceUnavailable;
  @BuiltValueEnumConst(wireName: r'internal_error')
  static const ScanNFC200ResponseErrorTypeEnum internalError = _$scanNFC200ResponseErrorTypeEnum_internalError;
  @BuiltValueEnumConst(wireName: r'conflict')
  static const ScanNFC200ResponseErrorTypeEnum conflict = _$scanNFC200ResponseErrorTypeEnum_conflict;
  @BuiltValueEnumConst(wireName: r'bad_request')
  static const ScanNFC200ResponseErrorTypeEnum badRequest = _$scanNFC200ResponseErrorTypeEnum_badRequest;

  static Serializer<ScanNFC200ResponseErrorTypeEnum> get serializer => _$scanNFC200ResponseErrorTypeEnumSerializer;

  const ScanNFC200ResponseErrorTypeEnum._(String name): super(name);

  static BuiltSet<ScanNFC200ResponseErrorTypeEnum> get values => _$scanNFC200ResponseErrorTypeEnumValues;
  static ScanNFC200ResponseErrorTypeEnum valueOf(String name) => _$scanNFC200ResponseErrorTypeEnumValueOf(name);
}

