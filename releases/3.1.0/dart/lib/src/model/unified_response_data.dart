//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'unified_response_data.g.dart';

/// UnifiedResponseData
@BuiltValue()
abstract class UnifiedResponseData implements Built<UnifiedResponseData, UnifiedResponseDataBuilder> {
  /// One Of [BuiltList<JsonObject>], [JsonObject]
  OneOf get oneOf;

  UnifiedResponseData._();

  factory UnifiedResponseData([void updates(UnifiedResponseDataBuilder b)]) = _$UnifiedResponseData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UnifiedResponseDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UnifiedResponseData> get serializer => _$UnifiedResponseDataSerializer();
}

class _$UnifiedResponseDataSerializer implements PrimitiveSerializer<UnifiedResponseData> {
  @override
  final Iterable<Type> types = const [UnifiedResponseData, _$UnifiedResponseData];

  @override
  final String wireName = r'UnifiedResponseData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UnifiedResponseData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
  }

  @override
  Object serialize(
    Serializers serializers,
    UnifiedResponseData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value, specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  UnifiedResponseData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnifiedResponseDataBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [FullType(JsonObject), FullType(BuiltList, [FullType.nullable(JsonObject)]), ]);
    oneOfDataSrc = serialized;
    result.oneOf = serializers.deserialize(oneOfDataSrc, specifiedType: targetType) as OneOf;
    return result.build();
  }
}

