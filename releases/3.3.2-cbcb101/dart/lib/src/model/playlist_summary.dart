//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'playlist_summary.g.dart';

/// PlaylistSummary
///
/// Properties:
/// * [id] 
/// * [title] 
/// * [trackCount] 
/// * [nfcTagId] 
/// * [serverSeq] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class PlaylistSummary implements Built<PlaylistSummary, PlaylistSummaryBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'track_count')
  int get trackCount;

  @BuiltValueField(wireName: r'nfc_tag_id')
  String? get nfcTagId;

  @BuiltValueField(wireName: r'server_seq')
  num? get serverSeq;

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime? get updatedAt;

  PlaylistSummary._();

  factory PlaylistSummary([void updates(PlaylistSummaryBuilder b)]) = _$PlaylistSummary;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PlaylistSummaryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PlaylistSummary> get serializer => _$PlaylistSummarySerializer();
}

class _$PlaylistSummarySerializer implements PrimitiveSerializer<PlaylistSummary> {
  @override
  final Iterable<Type> types = const [PlaylistSummary, _$PlaylistSummary];

  @override
  final String wireName = r'PlaylistSummary';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PlaylistSummary object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'track_count';
    yield serializers.serialize(
      object.trackCount,
      specifiedType: const FullType(int),
    );
    if (object.nfcTagId != null) {
      yield r'nfc_tag_id';
      yield serializers.serialize(
        object.nfcTagId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.serverSeq != null) {
      yield r'server_seq';
      yield serializers.serialize(
        object.serverSeq,
        specifiedType: const FullType(num),
      );
    }
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.updatedAt != null) {
      yield r'updated_at';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PlaylistSummary object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PlaylistSummaryBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'track_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.trackCount = valueDes;
          break;
        case r'nfc_tag_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nfcTagId = valueDes;
          break;
        case r'server_seq':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.serverSeq = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PlaylistSummary deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PlaylistSummaryBuilder();
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

