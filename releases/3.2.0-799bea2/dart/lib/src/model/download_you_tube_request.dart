//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'download_you_tube_request.g.dart';

/// DownloadYouTubeRequest
///
/// Properties:
/// * [url] 
/// * [playlistId] 
/// * [quality] 
/// * [clientOpId] 
@BuiltValue()
abstract class DownloadYouTubeRequest implements Built<DownloadYouTubeRequest, DownloadYouTubeRequestBuilder> {
  @BuiltValueField(wireName: r'url')
  String get url;

  @BuiltValueField(wireName: r'playlist_id')
  String get playlistId;

  @BuiltValueField(wireName: r'quality')
  String? get quality;

  @BuiltValueField(wireName: r'client_op_id')
  String? get clientOpId;

  DownloadYouTubeRequest._();

  factory DownloadYouTubeRequest([void updates(DownloadYouTubeRequestBuilder b)]) = _$DownloadYouTubeRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DownloadYouTubeRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DownloadYouTubeRequest> get serializer => _$DownloadYouTubeRequestSerializer();
}

class _$DownloadYouTubeRequestSerializer implements PrimitiveSerializer<DownloadYouTubeRequest> {
  @override
  final Iterable<Type> types = const [DownloadYouTubeRequest, _$DownloadYouTubeRequest];

  @override
  final String wireName = r'DownloadYouTubeRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DownloadYouTubeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'url';
    yield serializers.serialize(
      object.url,
      specifiedType: const FullType(String),
    );
    yield r'playlist_id';
    yield serializers.serialize(
      object.playlistId,
      specifiedType: const FullType(String),
    );
    if (object.quality != null) {
      yield r'quality';
      yield serializers.serialize(
        object.quality,
        specifiedType: const FullType(String),
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
    DownloadYouTubeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DownloadYouTubeRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.url = valueDes;
          break;
        case r'playlist_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.playlistId = valueDes;
          break;
        case r'quality':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.quality = valueDes;
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
  DownloadYouTubeRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DownloadYouTubeRequestBuilder();
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

