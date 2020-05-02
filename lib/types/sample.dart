import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sample.g.dart';

@JsonSerializable()
class Sample {
  final double temperature;
  final int createdAt;

  Sample({
    @required this.temperature,
    createdAt,
  }): this.createdAt = createdAt ?? DateTime.now().millisecondsSinceEpoch ;

  factory Sample.fromJson(Map<String, dynamic> json) =>
      _$SampleFromJson(json);

  Map<String, dynamic> toJson() => _$SampleToJson(this);
}
