// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  oAuthProvider: json['oAuthProvider'] as String,
  oAuthId: json['oAuthId'] as String,
  nickname: json['nickname'] as String,
  profileImageUrl: json['profileImageUrl'] as String,
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'oAuthProvider': instance.oAuthProvider,
  'oAuthId': instance.oAuthId,
  'nickname': instance.nickname,
  'profileImageUrl': instance.profileImageUrl,
};
