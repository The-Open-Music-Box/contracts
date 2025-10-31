//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'start_playlist200_response_all_of_data.g.dart';

/// StartPlaylist200ResponseAllOfData
///
/// Properties:
/// * [playlistId] 
/// * [started] 
@BuiltValue()
abstract class StartPlaylist200ResponseAllOfData implements Built<StartPlaylist200ResponseAllOfData, StartPlaylist200ResponseAllOfDataBuilder> {
  @BuiltValueField(wireName: r'playlist_id')
  String? get playlistId;

  @BuiltValueField(wireName: r'started')
  bool? get started;

  StartPlaylist200ResponseAllOfData._();

  factory StartPlaylist200ResponseAllOfData([void updates(StartPlaylist200ResponseAllOfDataBuilder b)]) = _$StartPlaylist200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StartPlaylist200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StartPlaylist200ResponseAllOfData> get serializer => _$StartPlaylist200ResponseAllOfDataSerializer();
}

class _$StartPlaylist200ResponseAllOfDataSerializer implements PrimitiveSerializer<StartPlaylist200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [StartPlaylist200ResponseAllOfData, _$StartPlaylist200ResponseAllOfData];

  @override
  final String wireName = r'StartPlaylist200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StartPlaylist200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.playlistId != null) {
      yield r'playlist_id';
      yield serializers.serialize(
        object.playlistId,
        specifiedType: const FullType(String),
      );
    }
    if (object.started != null) {
      yield r'started';
      yield serializers.serialize(
        object.started,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    StartPlaylist200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StartPlaylist200ResponseAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'playlist_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.playlistId = valueDes;
          break;
        case r'started':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.started = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StartPlaylist200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StartPlaylist200ResponseAllOfDataBuilder();
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

