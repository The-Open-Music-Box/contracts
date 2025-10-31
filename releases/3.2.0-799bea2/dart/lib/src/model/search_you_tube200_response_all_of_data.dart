//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:tomb_contracts/src/model/you_tube_search_result.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_you_tube200_response_all_of_data.g.dart';

/// SearchYouTube200ResponseAllOfData
///
/// Properties:
/// * [results] 
@BuiltValue()
abstract class SearchYouTube200ResponseAllOfData implements Built<SearchYouTube200ResponseAllOfData, SearchYouTube200ResponseAllOfDataBuilder> {
  @BuiltValueField(wireName: r'results')
  BuiltList<YouTubeSearchResult>? get results;

  SearchYouTube200ResponseAllOfData._();

  factory SearchYouTube200ResponseAllOfData([void updates(SearchYouTube200ResponseAllOfDataBuilder b)]) = _$SearchYouTube200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchYouTube200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchYouTube200ResponseAllOfData> get serializer => _$SearchYouTube200ResponseAllOfDataSerializer();
}

class _$SearchYouTube200ResponseAllOfDataSerializer implements PrimitiveSerializer<SearchYouTube200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [SearchYouTube200ResponseAllOfData, _$SearchYouTube200ResponseAllOfData];

  @override
  final String wireName = r'SearchYouTube200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchYouTube200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.results != null) {
      yield r'results';
      yield serializers.serialize(
        object.results,
        specifiedType: const FullType(BuiltList, [FullType(YouTubeSearchResult)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SearchYouTube200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SearchYouTube200ResponseAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'results':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(YouTubeSearchResult)]),
          ) as BuiltList<YouTubeSearchResult>;
          result.results.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SearchYouTube200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchYouTube200ResponseAllOfDataBuilder();
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

