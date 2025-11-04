//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:tomb_contracts/src/model/cleanup_stale_sessions200_response_all_of_data_cleaned_sessions_inner.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cleanup_stale_sessions200_response_all_of_data.g.dart';

/// CleanupStaleSessions200ResponseAllOfData
///
/// Properties:
/// * [cleanedSessions] 
@BuiltValue()
abstract class CleanupStaleSessions200ResponseAllOfData implements Built<CleanupStaleSessions200ResponseAllOfData, CleanupStaleSessions200ResponseAllOfDataBuilder> {
  @BuiltValueField(wireName: r'cleaned_sessions')
  BuiltList<CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner>? get cleanedSessions;

  CleanupStaleSessions200ResponseAllOfData._();

  factory CleanupStaleSessions200ResponseAllOfData([void updates(CleanupStaleSessions200ResponseAllOfDataBuilder b)]) = _$CleanupStaleSessions200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CleanupStaleSessions200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CleanupStaleSessions200ResponseAllOfData> get serializer => _$CleanupStaleSessions200ResponseAllOfDataSerializer();
}

class _$CleanupStaleSessions200ResponseAllOfDataSerializer implements PrimitiveSerializer<CleanupStaleSessions200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [CleanupStaleSessions200ResponseAllOfData, _$CleanupStaleSessions200ResponseAllOfData];

  @override
  final String wireName = r'CleanupStaleSessions200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CleanupStaleSessions200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.cleanedSessions != null) {
      yield r'cleaned_sessions';
      yield serializers.serialize(
        object.cleanedSessions,
        specifiedType: const FullType(BuiltList, [FullType(CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CleanupStaleSessions200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CleanupStaleSessions200ResponseAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cleaned_sessions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner)]),
          ) as BuiltList<CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner>;
          result.cleanedSessions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CleanupStaleSessions200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CleanupStaleSessions200ResponseAllOfDataBuilder();
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

