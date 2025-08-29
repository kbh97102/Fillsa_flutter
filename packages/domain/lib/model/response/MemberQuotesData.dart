import 'package:json_annotation/json_annotation.dart';

part 'MemberQuotesData.g.dart';

@JsonSerializable()
class MemberQuotesData {
  final int dailyQuoteSeq;
  final String quoteDate;
  final String quote;
  final String author;
  final String typingYnString;
  final String likeYnString;

  MemberQuotesData({
    required this.dailyQuoteSeq,
    required this.quoteDate,
    required this.quote,
    required this.author,
    required this.typingYnString,
    required this.likeYnString,
  });

  factory MemberQuotesData.fromJson(Map<String, dynamic> json) => _$MemberQuotesDataFromJson(json);
  Map<String, dynamic> toJson() => _$MemberQuotesDataToJson(this);
}