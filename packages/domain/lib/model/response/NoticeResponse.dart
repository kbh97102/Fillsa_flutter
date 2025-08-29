import 'package:json_annotation/json_annotation.dart';

part 'NoticeResponse.g.dart';

@JsonSerializable()
class NoticeResponse {
  final int noticeSeq;
  final String title;
  final String content;
  final String createdAt;

  NoticeResponse({
    required this.noticeSeq,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory NoticeResponse.fromJson(Map<String, dynamic> json) =>
      _$NoticeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeResponseToJson(this);
}
