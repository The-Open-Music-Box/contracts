//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chunk_upload_result.g.dart';

/// ChunkUploadResult
///
/// Properties:
/// * [chunkIndex] 
/// * [received] 
/// * [totalChunks] 
/// * [progressPercent] 
@BuiltValue()
abstract class ChunkUploadResult implements Built<ChunkUploadResult, ChunkUploadResultBuilder> {
  @BuiltValueField(wireName: r'chunk_index')
  int get chunkIndex;

  @BuiltValueField(wireName: r'received')
  bool get received;

  @BuiltValueField(wireName: r'total_chunks')
  int get totalChunks;

  @BuiltValueField(wireName: r'progress_percent')
  num? get progressPercent;

  ChunkUploadResult._();

  factory ChunkUploadResult([void updates(ChunkUploadResultBuilder b)]) = _$ChunkUploadResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChunkUploadResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChunkUploadResult> get serializer => _$ChunkUploadResultSerializer();
}

class _$ChunkUploadResultSerializer implements PrimitiveSerializer<ChunkUploadResult> {
  @override
  final Iterable<Type> types = const [ChunkUploadResult, _$ChunkUploadResult];

  @override
  final String wireName = r'ChunkUploadResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChunkUploadResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'chunk_index';
    yield serializers.serialize(
      object.chunkIndex,
      specifiedType: const FullType(int),
    );
    yield r'received';
    yield serializers.serialize(
      object.received,
      specifiedType: const FullType(bool),
    );
    yield r'total_chunks';
    yield serializers.serialize(
      object.totalChunks,
      specifiedType: const FullType(int),
    );
    if (object.progressPercent != null) {
      yield r'progress_percent';
      yield serializers.serialize(
        object.progressPercent,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ChunkUploadResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChunkUploadResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'chunk_index':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.chunkIndex = valueDes;
          break;
        case r'received':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.received = valueDes;
          break;
        case r'total_chunks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalChunks = valueDes;
          break;
        case r'progress_percent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.progressPercent = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChunkUploadResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChunkUploadResultBuilder();
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

