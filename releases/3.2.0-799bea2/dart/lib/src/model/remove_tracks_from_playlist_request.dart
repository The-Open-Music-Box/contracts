//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'remove_tracks_from_playlist_request.g.dart';

/// RemoveTracksFromPlaylistRequest
///
/// Properties:
/// * [trackIds] - List of track IDs to remove
/// * [clientOpId] 
@BuiltValue()
abstract class RemoveTracksFromPlaylistRequest implements Built<RemoveTracksFromPlaylistRequest, RemoveTracksFromPlaylistRequestBuilder> {
  /// List of track IDs to remove
  @BuiltValueField(wireName: r'track_ids')
  BuiltList<String> get trackIds;

  @BuiltValueField(wireName: r'client_op_id')
  String? get clientOpId;

  RemoveTracksFromPlaylistRequest._();

  factory RemoveTracksFromPlaylistRequest([void updates(RemoveTracksFromPlaylistRequestBuilder b)]) = _$RemoveTracksFromPlaylistRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RemoveTracksFromPlaylistRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoveTracksFromPlaylistRequest> get serializer => _$RemoveTracksFromPlaylistRequestSerializer();
}

class _$RemoveTracksFromPlaylistRequestSerializer implements PrimitiveSerializer<RemoveTracksFromPlaylistRequest> {
  @override
  final Iterable<Type> types = const [RemoveTracksFromPlaylistRequest, _$RemoveTracksFromPlaylistRequest];

  @override
  final String wireName = r'RemoveTracksFromPlaylistRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RemoveTracksFromPlaylistRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'track_ids';
    yield serializers.serialize(
      object.trackIds,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
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
    RemoveTracksFromPlaylistRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RemoveTracksFromPlaylistRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'track_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.trackIds.replace(valueDes);
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
  RemoveTracksFromPlaylistRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoveTracksFromPlaylistRequestBuilder();
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

