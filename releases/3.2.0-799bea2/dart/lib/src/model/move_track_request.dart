//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'move_track_request.g.dart';

/// MoveTrackRequest
///
/// Properties:
/// * [sourcePlaylistId] 
/// * [targetPlaylistId] 
/// * [trackId] 
/// * [targetPosition] 
/// * [clientOpId] 
@BuiltValue()
abstract class MoveTrackRequest implements Built<MoveTrackRequest, MoveTrackRequestBuilder> {
  @BuiltValueField(wireName: r'source_playlist_id')
  String get sourcePlaylistId;

  @BuiltValueField(wireName: r'target_playlist_id')
  String get targetPlaylistId;

  @BuiltValueField(wireName: r'track_id')
  String get trackId;

  @BuiltValueField(wireName: r'target_position')
  int? get targetPosition;

  @BuiltValueField(wireName: r'client_op_id')
  String? get clientOpId;

  MoveTrackRequest._();

  factory MoveTrackRequest([void updates(MoveTrackRequestBuilder b)]) = _$MoveTrackRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MoveTrackRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MoveTrackRequest> get serializer => _$MoveTrackRequestSerializer();
}

class _$MoveTrackRequestSerializer implements PrimitiveSerializer<MoveTrackRequest> {
  @override
  final Iterable<Type> types = const [MoveTrackRequest, _$MoveTrackRequest];

  @override
  final String wireName = r'MoveTrackRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MoveTrackRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'source_playlist_id';
    yield serializers.serialize(
      object.sourcePlaylistId,
      specifiedType: const FullType(String),
    );
    yield r'target_playlist_id';
    yield serializers.serialize(
      object.targetPlaylistId,
      specifiedType: const FullType(String),
    );
    yield r'track_id';
    yield serializers.serialize(
      object.trackId,
      specifiedType: const FullType(String),
    );
    if (object.targetPosition != null) {
      yield r'target_position';
      yield serializers.serialize(
        object.targetPosition,
        specifiedType: const FullType.nullable(int),
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
    MoveTrackRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MoveTrackRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'source_playlist_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourcePlaylistId = valueDes;
          break;
        case r'target_playlist_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.targetPlaylistId = valueDes;
          break;
        case r'track_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.trackId = valueDes;
          break;
        case r'target_position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.targetPosition = valueDes;
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
  MoveTrackRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MoveTrackRequestBuilder();
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

