// TokenInfo.dart
import 'package:json_annotation/json_annotation.dart';

part '../../model/response/TokenInfo.g.dart';

@JsonSerializable()
class TokenInfo {
  final String accessToken;
  final String refreshToken;

  TokenInfo({required this.accessToken, required this.refreshToken});

  factory TokenInfo.fromJson(Map<String, dynamic> json) =>
      _$TokenInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TokenInfoToJson(this);
}
