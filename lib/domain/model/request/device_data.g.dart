// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceData _$DeviceDataFromJson(Map<String, dynamic> json) => DeviceData(
  deviceId: json['deviceId'] as String,
  osType: json['osType'] as String,
  appVersion: json['appVersion'] as String,
  osVersion: json['osVersion'] as String,
  deviceModel: json['deviceModel'] as String,
);

Map<String, dynamic> _$DeviceDataToJson(DeviceData instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'osType': instance.osType,
      'appVersion': instance.appVersion,
      'osVersion': instance.osVersion,
      'deviceModel': instance.deviceModel,
    };
