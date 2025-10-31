//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'you_tube_search_result.g.dart';

/// YouTubeSearchResult
///
/// Properties:
/// * [videoId] 
/// * [title] 
/// * [duration] - Duration in seconds
/// * [thumbnail] 
/// * [channel] 
@BuiltValue()
abstract class YouTubeSearchResult implements Built<YouTubeSearchResult, YouTubeSearchResultBuilder> {
  @BuiltValueField(wireName: r'video_id')
  String get videoId;

  @BuiltValueField(wireName: r'title')
  String get title;

  /// Duration in seconds
  @BuiltValueField(wireName: r'duration')
  int get duration;

  @BuiltValueField(wireName: r'thumbnail')
  String? get thumbnail;

  @BuiltValueField(wireName: r'channel')
  String? get channel;

  YouTubeSearchResult._();

  factory YouTubeSearchResult([void updates(YouTubeSearchResultBuilder b)]) = _$YouTubeSearchResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(YouTubeSearchResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<YouTubeSearchResult> get serializer => _$YouTubeSearchResultSerializer();
}

class _$YouTubeSearchResultSerializer implements PrimitiveSerializer<YouTubeSearchResult> {
  @override
  final Iterable<Type> types = const [YouTubeSearchResult, _$YouTubeSearchResult];

  @override
  final String wireName = r'YouTubeSearchResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    YouTubeSearchResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'video_id';
    yield serializers.serialize(
      object.videoId,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'duration';
    yield serializers.serialize(
      object.duration,
      specifiedType: const FullType(int),
    );
    if (object.thumbnail != null) {
      yield r'thumbnail';
      yield serializers.serialize(
        object.thumbnail,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.channel != null) {
      yield r'channel';
      yield serializers.serialize(
        object.channel,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    YouTubeSearchResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required YouTubeSearchResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'video_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.videoId = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'duration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.duration = valueDes;
          break;
        case r'thumbnail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.thumbnail = valueDes;
          break;
        case r'channel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.channel = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  YouTubeSearchResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = YouTubeSearchResultBuilder();
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

