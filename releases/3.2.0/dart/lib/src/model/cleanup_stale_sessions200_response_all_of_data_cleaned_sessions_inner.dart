//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cleanup_stale_sessions200_response_all_of_data_cleaned_sessions_inner.g.dart';

/// CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner
///
/// Properties:
/// * [sessionId] 
/// * [filename] 
/// * [ageHours] 
@BuiltValue()
abstract class CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner implements Built<CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner, CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInnerBuilder> {
  @BuiltValueField(wireName: r'session_id')
  String? get sessionId;

  @BuiltValueField(wireName: r'filename')
  String? get filename;

  @BuiltValueField(wireName: r'age_hours')
  num? get ageHours;

  CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner._();

  factory CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner([void updates(CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInnerBuilder b)]) = _$CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner> get serializer => _$CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInnerSerializer();
}

class _$CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInnerSerializer implements PrimitiveSerializer<CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner> {
  @override
  final Iterable<Type> types = const [CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner, _$CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner];

  @override
  final String wireName = r'CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.sessionId != null) {
      yield r'session_id';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType(String),
      );
    }
    if (object.filename != null) {
      yield r'filename';
      yield serializers.serialize(
        object.filename,
        specifiedType: const FullType(String),
      );
    }
    if (object.ageHours != null) {
      yield r'age_hours';
      yield serializers.serialize(
        object.ageHours,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInnerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'session_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sessionId = valueDes;
          break;
        case r'filename':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.filename = valueDes;
          break;
        case r'age_hours':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.ageHours = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInnerBuilder();
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

