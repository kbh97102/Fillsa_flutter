import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  @JsonKey(name: 'oAuthProvider')
  final String oAuthProvider;

  @JsonKey(name: 'oAuthId')
  final String oAuthId;

  @JsonKey(name: 'nickname')
  final String nickname;

  @JsonKey(name: 'profileImageUrl')
  final String profileImageUrl;

  UserData({
    required this.oAuthProvider,
    required this.oAuthId,
    required this.nickname,
    required this.profileImageUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
