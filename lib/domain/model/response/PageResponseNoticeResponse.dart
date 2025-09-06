// PageResponseNoticeResponse.dart
import 'package:json_annotation/json_annotation.dart';
import 'NoticeResponse.dart'; // Assume NoticeResponse is in this file or imported from another.

part 'PageResponseNoticeResponse.g.dart';

@JsonSerializable()
class PageResponseNoticeResponse {
  final List<NoticeResponse> content;
  final int totalElements;
  final int totalPages;
  final int currentPage;

  PageResponseNoticeResponse({
    required this.content,
    required this.totalElements,
    required this.totalPages,
    required this.currentPage,
  });

  factory PageResponseNoticeResponse.fromJson(Map<String, dynamic> json) => _$PageResponseNoticeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PageResponseNoticeResponseToJson(this);
}