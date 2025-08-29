// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
  deviceData: DeviceData.fromJson(json['deviceData'] as Map<String, dynamic>),
  userData: UserData.fromJson(json['userData'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
  'deviceData': instance.deviceData,
  'userData': instance.userData,
};
