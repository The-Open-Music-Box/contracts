//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:tomb_contracts/src/model/playlist_summary.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_playlists200_response_all_of_data.g.dart';

/// ListPlaylists200ResponseAllOfData
///
/// Properties:
/// * [playlists] 
/// * [page] 
/// * [limit] 
/// * [total] 
/// * [totalPages] 
@BuiltValue()
abstract class ListPlaylists200ResponseAllOfData implements Built<ListPlaylists200ResponseAllOfData, ListPlaylists200ResponseAllOfDataBuilder> {
  @BuiltValueField(wireName: r'playlists')
  BuiltList<PlaylistSummary> get playlists;

  @BuiltValueField(wireName: r'page')
  int get page;

  @BuiltValueField(wireName: r'limit')
  int get limit;

  @BuiltValueField(wireName: r'total')
  int get total;

  @BuiltValueField(wireName: r'total_pages')
  int get totalPages;

  ListPlaylists200ResponseAllOfData._();

  factory ListPlaylists200ResponseAllOfData([void updates(ListPlaylists200ResponseAllOfDataBuilder b)]) = _$ListPlaylists200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ListPlaylists200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListPlaylists200ResponseAllOfData> get serializer => _$ListPlaylists200ResponseAllOfDataSerializer();
}

class _$ListPlaylists200ResponseAllOfDataSerializer implements PrimitiveSerializer<ListPlaylists200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [ListPlaylists200ResponseAllOfData, _$ListPlaylists200ResponseAllOfData];

  @override
  final String wireName = r'ListPlaylists200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListPlaylists200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'playlists';
    yield serializers.serialize(
      object.playlists,
      specifiedType: const FullType(BuiltList, [FullType(PlaylistSummary)]),
    );
    yield r'page';
    yield serializers.serialize(
      object.page,
      specifiedType: const FullType(int),
    );
    yield r'limit';
    yield serializers.serialize(
      object.limit,
      specifiedType: const FullType(int),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
    yield r'total_pages';
    yield serializers.serialize(
      object.totalPages,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ListPlaylists200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ListPlaylists200ResponseAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'playlists':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PlaylistSummary)]),
          ) as BuiltList<PlaylistSummary>;
          result.playlists.replace(valueDes);
          break;
        case r'page':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.page = valueDes;
          break;
        case r'limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.limit = valueDes;
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'total_pages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalPages = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ListPlaylists200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListPlaylists200ResponseAllOfDataBuilder();
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

