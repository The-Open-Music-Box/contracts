//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'nfc_association.g.dart';

/// NFCAssociation
///
/// Properties:
/// * [tagId] 
/// * [playlistId] 
/// * [playlistTitle] 
/// * [createdAt] 
@BuiltValue()
abstract class NFCAssociation implements Built<NFCAssociation, NFCAssociationBuilder> {
  @BuiltValueField(wireName: r'tag_id')
  String get tagId;

  @BuiltValueField(wireName: r'playlist_id')
  String get playlistId;

  @BuiltValueField(wireName: r'playlist_title')
  String get playlistTitle;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  NFCAssociation._();

  factory NFCAssociation([void updates(NFCAssociationBuilder b)]) = _$NFCAssociation;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NFCAssociationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NFCAssociation> get serializer => _$NFCAssociationSerializer();
}

class _$NFCAssociationSerializer implements PrimitiveSerializer<NFCAssociation> {
  @override
  final Iterable<Type> types = const [NFCAssociation, _$NFCAssociation];

  @override
  final String wireName = r'NFCAssociation';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NFCAssociation object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'tag_id';
    yield serializers.serialize(
      object.tagId,
      specifiedType: const FullType(String),
    );
    yield r'playlist_id';
    yield serializers.serialize(
      object.playlistId,
      specifiedType: const FullType(String),
    );
    yield r'playlist_title';
    yield serializers.serialize(
      object.playlistTitle,
      specifiedType: const FullType(String),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NFCAssociation object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NFCAssociationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'tag_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.tagId = valueDes;
          break;
        case r'playlist_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.playlistId = valueDes;
          break;
        case r'playlist_title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.playlistTitle = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NFCAssociation deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NFCAssociationBuilder();
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

