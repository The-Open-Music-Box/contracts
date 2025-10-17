//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:tomb_contracts/src/model/track.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upload_finalize_result.g.dart';

/// UploadFinalizeResult
///
/// Properties:
/// * [status] 
/// * [message] 
/// * [track] 
@BuiltValue()
abstract class UploadFinalizeResult implements Built<UploadFinalizeResult, UploadFinalizeResultBuilder> {
  @BuiltValueField(wireName: r'status')
  UploadFinalizeResultStatusEnum get status;
  // enum statusEnum {  success,  error,  };

  @BuiltValueField(wireName: r'message')
  String get message;

  @BuiltValueField(wireName: r'track')
  Track? get track;

  UploadFinalizeResult._();

  factory UploadFinalizeResult([void updates(UploadFinalizeResultBuilder b)]) = _$UploadFinalizeResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UploadFinalizeResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UploadFinalizeResult> get serializer => _$UploadFinalizeResultSerializer();
}

class _$UploadFinalizeResultSerializer implements PrimitiveSerializer<UploadFinalizeResult> {
  @override
  final Iterable<Type> types = const [UploadFinalizeResult, _$UploadFinalizeResult];

  @override
  final String wireName = r'UploadFinalizeResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UploadFinalizeResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(UploadFinalizeResultStatusEnum),
    );
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
    if (object.track != null) {
      yield r'track';
      yield serializers.serialize(
        object.track,
        specifiedType: const FullType.nullable(Track),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UploadFinalizeResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UploadFinalizeResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UploadFinalizeResultStatusEnum),
          ) as UploadFinalizeResultStatusEnum;
          result.status = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'track':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Track),
          ) as Track?;
          if (valueDes == null) continue;
          result.track.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UploadFinalizeResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UploadFinalizeResultBuilder();
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

class UploadFinalizeResultStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'success')
  static const UploadFinalizeResultStatusEnum success = _$uploadFinalizeResultStatusEnum_success;
  @BuiltValueEnumConst(wireName: r'error')
  static const UploadFinalizeResultStatusEnum error = _$uploadFinalizeResultStatusEnum_error;

  static Serializer<UploadFinalizeResultStatusEnum> get serializer => _$uploadFinalizeResultStatusEnumSerializer;

  const UploadFinalizeResultStatusEnum._(String name): super(name);

  static BuiltSet<UploadFinalizeResultStatusEnum> get values => _$uploadFinalizeResultStatusEnumValues;
  static UploadFinalizeResultStatusEnum valueOf(String name) => _$uploadFinalizeResultStatusEnumValueOf(name);
}

