// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
  loginData: LoginData.fromJson(json['loginData'] as Map<String, dynamic>),
  syncData: (json['syncData'] as List<dynamic>)
      .map((e) => DailySyncData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'loginData': instance.loginData,
      'syncData': instance.syncData,
    };
