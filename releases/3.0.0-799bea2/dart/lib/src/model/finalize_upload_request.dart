//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'finalize_upload_request.g.dart';

/// FinalizeUploadRequest
///
/// Properties:
/// * [fileHash] 
/// * [metadataOverride] 
/// * [clientOpId] 
@BuiltValue()
abstract class FinalizeUploadRequest implements Built<FinalizeUploadRequest, FinalizeUploadRequestBuilder> {
  @BuiltValueField(wireName: r'file_hash')
  String? get fileHash;

  @BuiltValueField(wireName: r'metadata_override')
  JsonObject? get metadataOverride;

  @BuiltValueField(wireName: r'client_op_id')
  String? get clientOpId;

  FinalizeUploadRequest._();

  factory FinalizeUploadRequest([void updates(FinalizeUploadRequestBuilder b)]) = _$FinalizeUploadRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FinalizeUploadRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FinalizeUploadRequest> get serializer => _$FinalizeUploadRequestSerializer();
}

class _$FinalizeUploadRequestSerializer implements PrimitiveSerializer<FinalizeUploadRequest> {
  @override
  final Iterable<Type> types = const [FinalizeUploadRequest, _$FinalizeUploadRequest];

  @override
  final String wireName = r'FinalizeUploadRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FinalizeUploadRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.fileHash != null) {
      yield r'file_hash';
      yield serializers.serialize(
        object.fileHash,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.metadataOverride != null) {
      yield r'metadata_override';
      yield serializers.serialize(
        object.metadataOverride,
        specifiedType: const FullType.nullable(JsonObject),
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
    FinalizeUploadRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FinalizeUploadRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'file_hash':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fileHash = valueDes;
          break;
        case r'metadata_override':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.metadataOverride = valueDes;
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
  FinalizeUploadRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FinalizeUploadRequestBuilder();
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

