import 'package:json_annotation/json_annotation.dart';

part 'MemberQuotesResponse.g.dart';

@JsonSerializable()
class MemberQuotesResponse {
  final int memberQuoteSeq;
  final String quoteDate;
  final String quoteDayOfWeek;
  final String? korQuote;
  final String? engQuote;
  final String? korAuthor;
  final String? engAuthor;
  final String authorUrl;
  final String? memo;
  final String memoYnString;
  final String likeYnString;
  final String? imagePath;

  MemberQuotesResponse({
    required this.memberQuoteSeq,
    required this.quoteDate,
    required this.quoteDayOfWeek,
    this.korQuote,
    this.engQuote,
    this.korAuthor,
    this.engAuthor,
    required this.authorUrl,
    this.memo,
    required this.memoYnString,
    required this.likeYnString,
    this.imagePath,
  });

  factory MemberQuotesResponse.fromJson(Map<String, dynamic> json) =>
      _$MemberQuotesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MemberQuotesResponseToJson(this);
}
