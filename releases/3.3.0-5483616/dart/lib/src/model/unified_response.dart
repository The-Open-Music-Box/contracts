//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:tomb_contracts/src/model/unified_response_data.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'unified_response.g.dart';

/// Standardized response wrapper used by all API endpoints
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
@BuiltValue(instantiable: false)
abstract class UnifiedResponse  {
  @BuiltValueField(wireName: r'status')
  UnifiedResponseStatusEnum get status;
  // enum statusEnum {  success,  error,  };

  @BuiltValueField(wireName: r'message')
  String get message;

  @BuiltValueField(wireName: r'data')
  UnifiedResponseData? get data;

  /// Client operation ID for operation tracking
  @BuiltValueField(wireName: r'client_op_id')
  String? get clientOpId;

  /// Server sequence number for state synchronization
  @BuiltValueField(wireName: r'server_seq')
  num? get serverSeq;

  /// Unix timestamp in seconds
  @BuiltValueField(wireName: r'timestamp')
  num get timestamp;

  @BuiltValueField(wireName: r'request_id')
  String? get requestId;

  @BuiltValueField(wireName: r'error_type')
  UnifiedResponseErrorTypeEnum? get errorType;
  // enum errorTypeEnum {  validation_error,  not_found,  rate_limit_exceeded,  service_unavailable,  internal_error,  conflict,  bad_request,  };

  @BuiltValueField(wireName: r'details')
  BuiltMap<String, JsonObject?>? get details;

  @BuiltValueSerializer(custom: true)
  static Serializer<UnifiedResponse> get serializer => _$UnifiedResponseSerializer();
}

class _$UnifiedResponseSerializer implements PrimitiveSerializer<UnifiedResponse> {
  @override
  final Iterable<Type> types = const [UnifiedResponse];

  @override
  final String wireName = r'UnifiedResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UnifiedResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(UnifiedResponseStatusEnum),
    );
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
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
    if (object.serverSeq != null) {
      yield r'server_seq';
      yield serializers.serialize(
        object.serverSeq,
        specifiedType: const FullType.nullable(num),
      );
    }
    yield r'timestamp';
    yield serializers.serialize(
      object.timestamp,
      specifiedType: const FullType(num),
    );
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
    if (object.details != null) {
      yield r'details';
      yield serializers.serialize(
        object.details,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UnifiedResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  UnifiedResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($UnifiedResponse)) as $UnifiedResponse;
  }
}

/// a concrete implementation of [UnifiedResponse], since [UnifiedResponse] is not instantiable
@BuiltValue(instantiable: true)
abstract class $UnifiedResponse implements UnifiedResponse, Built<$UnifiedResponse, $UnifiedResponseBuilder> {
  $UnifiedResponse._();

  factory $UnifiedResponse([void Function($UnifiedResponseBuilder)? updates]) = _$$UnifiedResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($UnifiedResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$UnifiedResponse> get serializer => _$$UnifiedResponseSerializer();
}

class _$$UnifiedResponseSerializer implements PrimitiveSerializer<$UnifiedResponse> {
  @override
  final Iterable<Type> types = const [$UnifiedResponse, _$$UnifiedResponse];

  @override
  final String wireName = r'$UnifiedResponse';

  @override
  Object serialize(
    Serializers serializers,
    $UnifiedResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(UnifiedResponse))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UnifiedResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UnifiedResponseStatusEnum),
          ) as UnifiedResponseStatusEnum;
          result.status = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
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
        case r'server_seq':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.serverSeq = valueDes;
          break;
        case r'timestamp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.timestamp = valueDes;
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
        case r'details':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>?;
          if (valueDes == null) continue;
          result.details.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $UnifiedResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $UnifiedResponseBuilder();
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

class UnifiedResponseStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'success')
  static const UnifiedResponseStatusEnum success = _$unifiedResponseStatusEnum_success;
  @BuiltValueEnumConst(wireName: r'error')
  static const UnifiedResponseStatusEnum error = _$unifiedResponseStatusEnum_error;

  static Serializer<UnifiedResponseStatusEnum> get serializer => _$unifiedResponseStatusEnumSerializer;

  const UnifiedResponseStatusEnum._(String name): super(name);

  static BuiltSet<UnifiedResponseStatusEnum> get values => _$unifiedResponseStatusEnumValues;
  static UnifiedResponseStatusEnum valueOf(String name) => _$unifiedResponseStatusEnumValueOf(name);
}

class UnifiedResponseErrorTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'validation_error')
  static const UnifiedResponseErrorTypeEnum validationError = _$unifiedResponseErrorTypeEnum_validationError;
  @BuiltValueEnumConst(wireName: r'not_found')
  static const UnifiedResponseErrorTypeEnum notFound = _$unifiedResponseErrorTypeEnum_notFound;
  @BuiltValueEnumConst(wireName: r'rate_limit_exceeded')
  static const UnifiedResponseErrorTypeEnum rateLimitExceeded = _$unifiedResponseErrorTypeEnum_rateLimitExceeded;
  @BuiltValueEnumConst(wireName: r'service_unavailable')
  static const UnifiedResponseErrorTypeEnum serviceUnavailable = _$unifiedResponseErrorTypeEnum_serviceUnavailable;
  @BuiltValueEnumConst(wireName: r'internal_error')
  static const UnifiedResponseErrorTypeEnum internalError = _$unifiedResponseErrorTypeEnum_internalError;
  @BuiltValueEnumConst(wireName: r'conflict')
  static const UnifiedResponseErrorTypeEnum conflict = _$unifiedResponseErrorTypeEnum_conflict;
  @BuiltValueEnumConst(wireName: r'bad_request')
  static const UnifiedResponseErrorTypeEnum badRequest = _$unifiedResponseErrorTypeEnum_badRequest;

  static Serializer<UnifiedResponseErrorTypeEnum> get serializer => _$unifiedResponseErrorTypeEnumSerializer;

  const UnifiedResponseErrorTypeEnum._(String name): super(name);

  static BuiltSet<UnifiedResponseErrorTypeEnum> get values => _$unifiedResponseErrorTypeEnumValues;
  static UnifiedResponseErrorTypeEnum valueOf(String name) => _$unifiedResponseErrorTypeEnumValueOf(name);
}

