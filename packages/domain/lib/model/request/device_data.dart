import 'package:json_annotation/json_annotation.dart';

part 'device_data.g.dart';

@JsonSerializable()
class DeviceData {
  final String deviceId;
  final String osType;
  final String appVersion;
  final String osVersion;
  final String deviceModel;

  DeviceData({
    required this.deviceId,
    required this.osType,
    required this.appVersion,
    required this.osVersion,
    required this.deviceModel,
  });

  factory DeviceData.fromJson(Map<String, dynamic> json) =>
      _$DeviceDataFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceDataToJson(this);
}
