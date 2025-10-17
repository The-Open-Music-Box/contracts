//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'set_volume_request.g.dart';

/// SetVolumeRequest
///
/// Properties:
/// * [volume] 
/// * [clientOpId] 
@BuiltValue()
abstract class SetVolumeRequest implements Built<SetVolumeRequest, SetVolumeRequestBuilder> {
  @BuiltValueField(wireName: r'volume')
  int get volume;

  @BuiltValueField(wireName: r'client_op_id')
  String? get clientOpId;

  SetVolumeRequest._();

  factory SetVolumeRequest([void updates(SetVolumeRequestBuilder b)]) = _$SetVolumeRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SetVolumeRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SetVolumeRequest> get serializer => _$SetVolumeRequestSerializer();
}

class _$SetVolumeRequestSerializer implements PrimitiveSerializer<SetVolumeRequest> {
  @override
  final Iterable<Type> types = const [SetVolumeRequest, _$SetVolumeRequest];

  @override
  final String wireName = r'SetVolumeRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SetVolumeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'volume';
    yield serializers.serialize(
      object.volume,
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
    SetVolumeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SetVolumeRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'volume':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.volume = valueDes;
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
  SetVolumeRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SetVolumeRequestBuilder();
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

