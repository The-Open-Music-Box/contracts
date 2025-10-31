//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'associate_nfc_request.g.dart';

/// AssociateNFCRequest
///
/// Properties:
/// * [playlistId] 
/// * [tagId] 
/// * [clientOpId] 
@BuiltValue()
abstract class AssociateNFCRequest implements Built<AssociateNFCRequest, AssociateNFCRequestBuilder> {
  @BuiltValueField(wireName: r'playlist_id')
  String get playlistId;

  @BuiltValueField(wireName: r'tag_id')
  String get tagId;

  @BuiltValueField(wireName: r'client_op_id')
  String? get clientOpId;

  AssociateNFCRequest._();

  factory AssociateNFCRequest([void updates(AssociateNFCRequestBuilder b)]) = _$AssociateNFCRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AssociateNFCRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AssociateNFCRequest> get serializer => _$AssociateNFCRequestSerializer();
}

class _$AssociateNFCRequestSerializer implements PrimitiveSerializer<AssociateNFCRequest> {
  @override
  final Iterable<Type> types = const [AssociateNFCRequest, _$AssociateNFCRequest];

  @override
  final String wireName = r'AssociateNFCRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AssociateNFCRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'playlist_id';
    yield serializers.serialize(
      object.playlistId,
      specifiedType: const FullType(String),
    );
    yield r'tag_id';
    yield serializers.serialize(
      object.tagId,
      specifiedType: const FullType(String),
    );
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
    AssociateNFCRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AssociateNFCRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'playlist_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.playlistId = valueDes;
          break;
        case r'tag_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.tagId = valueDes;
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
  AssociateNFCRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AssociateNFCRequestBuilder();
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

