import 'package:json_annotation/json_annotation.dart';

part 'LoginResponse.g.dart';

@JsonSerializable()
class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final int memberSeq;
  final String nickname;
  final String profileImageUrl;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.memberSeq,
    required this.nickname,
    required this.profileImageUrl,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
