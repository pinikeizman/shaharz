// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sample _$SampleFromJson(Map<String, dynamic> json) {
  return Sample(
    temperature: (json['temperature'] as num)?.toDouble(),
    createdAt: json['createdAt'],
  );
}

Map<String, dynamic> _$SampleToJson(Sample instance) => <String, dynamic>{
      'temperature': instance.temperature,
      'createdAt': instance.createdAt,
    };
