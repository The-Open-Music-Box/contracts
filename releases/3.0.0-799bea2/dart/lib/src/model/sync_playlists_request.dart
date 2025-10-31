//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sync_playlists_request.g.dart';

/// SyncPlaylistsRequest
///
/// Properties:
/// * [lastSyncSeq] - Last known server sequence number
/// * [clientOpId] 
@BuiltValue()
abstract class SyncPlaylistsRequest implements Built<SyncPlaylistsRequest, SyncPlaylistsRequestBuilder> {
  /// Last known server sequence number
  @BuiltValueField(wireName: r'last_sync_seq')
  num? get lastSyncSeq;

  @BuiltValueField(wireName: r'client_op_id')
  String? get clientOpId;

  SyncPlaylistsRequest._();

  factory SyncPlaylistsRequest([void updates(SyncPlaylistsRequestBuilder b)]) = _$SyncPlaylistsRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SyncPlaylistsRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SyncPlaylistsRequest> get serializer => _$SyncPlaylistsRequestSerializer();
}

class _$SyncPlaylistsRequestSerializer implements PrimitiveSerializer<SyncPlaylistsRequest> {
  @override
  final Iterable<Type> types = const [SyncPlaylistsRequest, _$SyncPlaylistsRequest];

  @override
  final String wireName = r'SyncPlaylistsRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SyncPlaylistsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.lastSyncSeq != null) {
      yield r'last_sync_seq';
      yield serializers.serialize(
        object.lastSyncSeq,
        specifiedType: const FullType(num),
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
    SyncPlaylistsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SyncPlaylistsRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'last_sync_seq':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.lastSyncSeq = valueDes;
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
  SyncPlaylistsRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SyncPlaylistsRequestBuilder();
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

