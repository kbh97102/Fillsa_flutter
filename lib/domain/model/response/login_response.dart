import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'accessToken')
  final String accessToken;

  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  @JsonKey(name: 'memberSeq')
  final int memberSeq;

  @JsonKey(name: 'nickname')
  final String nickname;

  @JsonKey(name: 'profileImageUrl')
  final String profileImageUrl;

  // 생성자
  const LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.memberSeq,
    required this.nickname,
    required this.profileImageUrl,
  });

  // JSON Map에서 LoginResponse 객체를 생성하는 factory 생성자
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  // LoginResponse 객체를 JSON Map으로 변환하는 메서드
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
