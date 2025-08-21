import 'package:json_annotation/json_annotation.dart';

part 'LikeRequest.g.dart';

@JsonSerializable()
class LikeRequest {
  final String likeYn;

  LikeRequest({required this.likeYn});

  factory LikeRequest.fromJson(Map<String, dynamic> json) =>
      _$LikeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LikeRequestToJson(this);
}
