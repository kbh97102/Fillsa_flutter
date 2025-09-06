import 'package:json_annotation/json_annotation.dart';

import 'MemberQuotesResponse.dart';

part 'PageResponseMemberQuotesResponse.g.dart';

@JsonSerializable()
class PageResponseMemberQuotesResponse {
  final List<MemberQuotesResponse> content;
  final int totalElements;
  final int totalPages;
  final int currentPage;

  PageResponseMemberQuotesResponse({
    required this.content,
    required this.totalElements,
    required this.totalPages,
    required this.currentPage,
  });

  factory PageResponseMemberQuotesResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$PageResponseMemberQuotesResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$PageResponseMemberQuotesResponseToJson(this);
}
