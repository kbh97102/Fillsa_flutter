import 'package:json_annotation/json_annotation.dart';

part 'ErrorResponse.g.dart';

@JsonSerializable()
class ErrorResponse {
  final String timestamp;
  final int httpStatus;
  final int errorCode;
  final String message;

  ErrorResponse({
    required this.timestamp,
    required this.httpStatus,
    required this.errorCode,
    required this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
