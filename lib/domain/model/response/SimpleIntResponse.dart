// SimpleIntResponse.dart
import 'package:json_annotation/json_annotation.dart';

part 'SimpleIntResponse.g.dart';

@JsonSerializable()
class SimpleIntResponse {
  final int value;

  SimpleIntResponse({
    required this.value,
  });

  factory SimpleIntResponse.fromJson(Map<String, dynamic> json) => _$SimpleIntResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SimpleIntResponseToJson(this);
}