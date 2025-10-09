//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:tomb_contracts/src/model/track.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'player_state.g.dart';

/// PlayerState
///
/// Properties:
/// * [isPlaying] 
/// * [activePlaylistId] 
/// * [activePlaylistTitle] 
/// * [activeTrackId] 
/// * [activeTrack] 
/// * [trackIndex] - 0-based track index in playlist
/// * [trackCount] - Total number of tracks in playlist
/// * [positionMs] - Current playback position in milliseconds
/// * [durationMs] - Track duration in milliseconds
/// * [canPrev] 
/// * [canNext] 
/// * [volume] 
/// * [serverSeq] 
@BuiltValue()
abstract class PlayerState implements Built<PlayerState, PlayerStateBuilder> {
  @BuiltValueField(wireName: r'is_playing')
  bool get isPlaying;

  @BuiltValueField(wireName: r'active_playlist_id')
  String? get activePlaylistId;

  @BuiltValueField(wireName: r'active_playlist_title')
  String? get activePlaylistTitle;

  @BuiltValueField(wireName: r'active_track_id')
  String? get activeTrackId;

  @BuiltValueField(wireName: r'active_track')
  Track? get activeTrack;

  /// 0-based track index in playlist
  @BuiltValueField(wireName: r'track_index')
  int? get trackIndex;

  /// Total number of tracks in playlist
  @BuiltValueField(wireName: r'track_count')
  int? get trackCount;

  /// Current playback position in milliseconds
  @BuiltValueField(wireName: r'position_ms')
  int get positionMs;

  /// Track duration in milliseconds
  @BuiltValueField(wireName: r'duration_ms')
  int? get durationMs;

  @BuiltValueField(wireName: r'can_prev')
  bool get canPrev;

  @BuiltValueField(wireName: r'can_next')
  bool get canNext;

  @BuiltValueField(wireName: r'volume')
  int? get volume;

  @BuiltValueField(wireName: r'server_seq')
  num get serverSeq;

  PlayerState._();

  factory PlayerState([void updates(PlayerStateBuilder b)]) = _$PlayerState;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PlayerStateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PlayerState> get serializer => _$PlayerStateSerializer();
}

class _$PlayerStateSerializer implements PrimitiveSerializer<PlayerState> {
  @override
  final Iterable<Type> types = const [PlayerState, _$PlayerState];

  @override
  final String wireName = r'PlayerState';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PlayerState object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'is_playing';
    yield serializers.serialize(
      object.isPlaying,
      specifiedType: const FullType(bool),
    );
    if (object.activePlaylistId != null) {
      yield r'active_playlist_id';
      yield serializers.serialize(
        object.activePlaylistId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.activePlaylistTitle != null) {
      yield r'active_playlist_title';
      yield serializers.serialize(
        object.activePlaylistTitle,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.activeTrackId != null) {
      yield r'active_track_id';
      yield serializers.serialize(
        object.activeTrackId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.activeTrack != null) {
      yield r'active_track';
      yield serializers.serialize(
        object.activeTrack,
        specifiedType: const FullType.nullable(Track),
      );
    }
    if (object.trackIndex != null) {
      yield r'track_index';
      yield serializers.serialize(
        object.trackIndex,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.trackCount != null) {
      yield r'track_count';
      yield serializers.serialize(
        object.trackCount,
        specifiedType: const FullType.nullable(int),
      );
    }
    yield r'position_ms';
    yield serializers.serialize(
      object.positionMs,
      specifiedType: const FullType(int),
    );
    if (object.durationMs != null) {
      yield r'duration_ms';
      yield serializers.serialize(
        object.durationMs,
        specifiedType: const FullType.nullable(int),
      );
    }
    yield r'can_prev';
    yield serializers.serialize(
      object.canPrev,
      specifiedType: const FullType(bool),
    );
    yield r'can_next';
    yield serializers.serialize(
      object.canNext,
      specifiedType: const FullType(bool),
    );
    if (object.volume != null) {
      yield r'volume';
      yield serializers.serialize(
        object.volume,
        specifiedType: const FullType.nullable(int),
      );
    }
    yield r'server_seq';
    yield serializers.serialize(
      object.serverSeq,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PlayerState object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PlayerStateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'is_playing':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPlaying = valueDes;
          break;
        case r'active_playlist_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.activePlaylistId = valueDes;
          break;
        case r'active_playlist_title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.activePlaylistTitle = valueDes;
          break;
        case r'active_track_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.activeTrackId = valueDes;
          break;
        case r'active_track':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Track),
          ) as Track?;
          if (valueDes == null) continue;
          result.activeTrack.replace(valueDes);
          break;
        case r'track_index':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.trackIndex = valueDes;
          break;
        case r'track_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.trackCount = valueDes;
          break;
        case r'position_ms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.positionMs = valueDes;
          break;
        case r'duration_ms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.durationMs = valueDes;
          break;
        case r'can_prev':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.canPrev = valueDes;
          break;
        case r'can_next':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.canNext = valueDes;
          break;
        case r'volume':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.volume = valueDes;
          break;
        case r'server_seq':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.serverSeq = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PlayerState deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PlayerStateBuilder();
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

