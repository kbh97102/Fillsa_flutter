import 'package:json_annotation/json_annotation.dart';

part 'memo_request.g.dart';

@JsonSerializable()
class MemoRequest {
  @JsonKey(name: 'memo')
  final String memo;

  MemoRequest({required this.memo});

  factory MemoRequest.fromJson(Map<String, dynamic> json) =>
      _$MemoRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MemoRequestToJson(this);
}
