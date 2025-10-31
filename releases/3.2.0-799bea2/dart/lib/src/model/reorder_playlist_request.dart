//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reorder_playlist_request.g.dart';

/// ReorderPlaylistRequest
///
/// Properties:
/// * [trackIds] - Ordered list of track IDs
/// * [clientOpId] 
@BuiltValue()
abstract class ReorderPlaylistRequest implements Built<ReorderPlaylistRequest, ReorderPlaylistRequestBuilder> {
  /// Ordered list of track IDs
  @BuiltValueField(wireName: r'track_ids')
  BuiltList<String> get trackIds;

  @BuiltValueField(wireName: r'client_op_id')
  String? get clientOpId;

  ReorderPlaylistRequest._();

  factory ReorderPlaylistRequest([void updates(ReorderPlaylistRequestBuilder b)]) = _$ReorderPlaylistRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReorderPlaylistRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReorderPlaylistRequest> get serializer => _$ReorderPlaylistRequestSerializer();
}

class _$ReorderPlaylistRequestSerializer implements PrimitiveSerializer<ReorderPlaylistRequest> {
  @override
  final Iterable<Type> types = const [ReorderPlaylistRequest, _$ReorderPlaylistRequest];

  @override
  final String wireName = r'ReorderPlaylistRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReorderPlaylistRequest object, {
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
    ReorderPlaylistRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReorderPlaylistRequestBuilder result,
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
  ReorderPlaylistRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReorderPlaylistRequestBuilder();
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

