//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'scan_nfc_request.g.dart';

/// ScanNFCRequest
///
/// Properties:
/// * [timeout] - Scan timeout in seconds
/// * [clientOpId] 
@BuiltValue()
abstract class ScanNFCRequest implements Built<ScanNFCRequest, ScanNFCRequestBuilder> {
  /// Scan timeout in seconds
  @BuiltValueField(wireName: r'timeout')
  int? get timeout;

  @BuiltValueField(wireName: r'client_op_id')
  String? get clientOpId;

  ScanNFCRequest._();

  factory ScanNFCRequest([void updates(ScanNFCRequestBuilder b)]) = _$ScanNFCRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScanNFCRequestBuilder b) => b
      ..timeout = 30;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScanNFCRequest> get serializer => _$ScanNFCRequestSerializer();
}

class _$ScanNFCRequestSerializer implements PrimitiveSerializer<ScanNFCRequest> {
  @override
  final Iterable<Type> types = const [ScanNFCRequest, _$ScanNFCRequest];

  @override
  final String wireName = r'ScanNFCRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScanNFCRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.timeout != null) {
      yield r'timeout';
      yield serializers.serialize(
        object.timeout,
        specifiedType: const FullType(int),
      );
    }
    if (object.clientOpId != null) {
      yield r'client_op_id';
      yield serializers.serialize(
        object.clientOpId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ScanNFCRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ScanNFCRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'timeout':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.timeout = valueDes;
          break;
        case r'client_op_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clientOpId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ScanNFCRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScanNFCRequestBuilder();
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

