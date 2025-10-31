//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'player_seek_request.g.dart';

/// PlayerSeekRequest
///
/// Properties:
/// * [positionMs] - Position in milliseconds
/// * [clientOpId] 
@BuiltValue()
abstract class PlayerSeekRequest implements Built<PlayerSeekRequest, PlayerSeekRequestBuilder> {
  /// Position in milliseconds
  @BuiltValueField(wireName: r'position_ms')
  int get positionMs;

  @BuiltValueField(wireName: r'client_op_id')
  String? get clientOpId;

  PlayerSeekRequest._();

  factory PlayerSeekRequest([void updates(PlayerSeekRequestBuilder b)]) = _$PlayerSeekRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PlayerSeekRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PlayerSeekRequest> get serializer => _$PlayerSeekRequestSerializer();
}

class _$PlayerSeekRequestSerializer implements PrimitiveSerializer<PlayerSeekRequest> {
  @override
  final Iterable<Type> types = const [PlayerSeekRequest, _$PlayerSeekRequest];

  @override
  final String wireName = r'PlayerSeekRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PlayerSeekRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'position_ms';
    yield serializers.serialize(
      object.positionMs,
      specifiedType: const FullType(int),
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
    PlayerSeekRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PlayerSeekRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'position_ms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.positionMs = valueDes;
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
  PlayerSeekRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PlayerSeekRequestBuilder();
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

