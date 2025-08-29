// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      memberSeq: (json['memberSeq'] as num).toInt(),
      nickname: json['nickname'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'memberSeq': instance.memberSeq,
      'nickname': instance.nickname,
      'profileImageUrl': instance.profileImageUrl,
    };
