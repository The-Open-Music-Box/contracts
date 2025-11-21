//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'health_status_services.g.dart';

/// HealthStatusServices
///
/// Properties:
/// * [api] 
/// * [audio] 
/// * [nfc] 
/// * [gpio] 
/// * [ledHat] 
/// * [websocket] 
@BuiltValue()
abstract class HealthStatusServices implements Built<HealthStatusServices, HealthStatusServicesBuilder> {
  @BuiltValueField(wireName: r'api')
  bool get api;

  @BuiltValueField(wireName: r'audio')
  bool get audio;

  @BuiltValueField(wireName: r'nfc')
  bool get nfc;

  @BuiltValueField(wireName: r'gpio')
  bool get gpio;

  @BuiltValueField(wireName: r'led_hat')
  bool get ledHat;

  @BuiltValueField(wireName: r'websocket')
  bool get websocket;

  HealthStatusServices._();

  factory HealthStatusServices([void updates(HealthStatusServicesBuilder b)]) = _$HealthStatusServices;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HealthStatusServicesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HealthStatusServices> get serializer => _$HealthStatusServicesSerializer();
}

class _$HealthStatusServicesSerializer implements PrimitiveSerializer<HealthStatusServices> {
  @override
  final Iterable<Type> types = const [HealthStatusServices, _$HealthStatusServices];

  @override
  final String wireName = r'HealthStatusServices';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HealthStatusServices object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'api';
    yield serializers.serialize(
      object.api,
      specifiedType: const FullType(bool),
    );
    yield r'audio';
    yield serializers.serialize(
      object.audio,
      specifiedType: const FullType(bool),
    );
    yield r'nfc';
    yield serializers.serialize(
      object.nfc,
      specifiedType: const FullType(bool),
    );
    yield r'gpio';
    yield serializers.serialize(
      object.gpio,
      specifiedType: const FullType(bool),
    );
    yield r'led_hat';
    yield serializers.serialize(
      object.ledHat,
      specifiedType: const FullType(bool),
    );
    yield r'websocket';
    yield serializers.serialize(
      object.websocket,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    HealthStatusServices object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required HealthStatusServicesBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'api':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.api = valueDes;
          break;
        case r'audio':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.audio = valueDes;
          break;
        case r'nfc':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.nfc = valueDes;
          break;
        case r'gpio':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.gpio = valueDes;
          break;
        case r'led_hat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.ledHat = valueDes;
          break;
        case r'websocket':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.websocket = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HealthStatusServices deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HealthStatusServicesBuilder();
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

