//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:tomb_contracts/src/model/playlist_detailed.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sync_playlists200_response_all_of_data.g.dart';

/// SyncPlaylists200ResponseAllOfData
///
/// Properties:
/// * [playlists] 
/// * [serverSeq] 
@BuiltValue()
abstract class SyncPlaylists200ResponseAllOfData implements Built<SyncPlaylists200ResponseAllOfData, SyncPlaylists200ResponseAllOfDataBuilder> {
  @BuiltValueField(wireName: r'playlists')
  BuiltList<PlaylistDetailed>? get playlists;

  @BuiltValueField(wireName: r'server_seq')
  num? get serverSeq;

  SyncPlaylists200ResponseAllOfData._();

  factory SyncPlaylists200ResponseAllOfData([void updates(SyncPlaylists200ResponseAllOfDataBuilder b)]) = _$SyncPlaylists200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SyncPlaylists200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SyncPlaylists200ResponseAllOfData> get serializer => _$SyncPlaylists200ResponseAllOfDataSerializer();
}

class _$SyncPlaylists200ResponseAllOfDataSerializer implements PrimitiveSerializer<SyncPlaylists200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [SyncPlaylists200ResponseAllOfData, _$SyncPlaylists200ResponseAllOfData];

  @override
  final String wireName = r'SyncPlaylists200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SyncPlaylists200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.playlists != null) {
      yield r'playlists';
      yield serializers.serialize(
        object.playlists,
        specifiedType: const FullType(BuiltList, [FullType(PlaylistDetailed)]),
      );
    }
    if (object.serverSeq != null) {
      yield r'server_seq';
      yield serializers.serialize(
        object.serverSeq,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SyncPlaylists200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SyncPlaylists200ResponseAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'playlists':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PlaylistDetailed)]),
          ) as BuiltList<PlaylistDetailed>;
          result.playlists.replace(valueDes);
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
  SyncPlaylists200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SyncPlaylists200ResponseAllOfDataBuilder();
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

