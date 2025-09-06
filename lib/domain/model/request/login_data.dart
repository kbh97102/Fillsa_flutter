import 'package:json_annotation/json_annotation.dart';

import 'device_data.dart';
import 'user_data.dart';

part 'login_data.g.dart';

@JsonSerializable()
class LoginData {
  @JsonKey(name: 'deviceData')
  final DeviceData deviceData;

  @JsonKey(name: 'userData')
  final UserData userData;

  LoginData({required this.deviceData, required this.userData});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
