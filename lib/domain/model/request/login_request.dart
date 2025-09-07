import 'package:json_annotation/json_annotation.dart';

import 'daily_sync_data.dart';
import 'login_data.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  final LoginData loginData;
  final List<DailySyncData> syncData;

  LoginRequest({required this.loginData, required this.syncData});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
