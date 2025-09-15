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

  factory ErrorResponse.defaultError() {
    return ErrorResponse(
      timestamp: DateTime.now().toIso8601String(),
      httpStatus: 500,
      errorCode: 9999,
      message: '알 수 없는 에러가 발생했습니다.',
    );
  }

  // Kotlin 코드의 getTokenExpired() 와 같은 역할
  factory ErrorResponse.tokenExpiredError() {
    return ErrorResponse(
      timestamp: DateTime.now().toIso8601String(),
      httpStatus: 401,
      errorCode: 8001,
      message: '인증이 만료되었습니다. 다시 로그인해주세요.',
    );
  }
}
