import 'package:json_annotation/json_annotation.dart';

part 'DailyQuotaNoToken.g.dart';

@JsonSerializable()
class DailyQuotaNoToken {
  final int dailyQuoteSeq;
  final String? korQuote;
  final String? engQuote;
  final String? korAuthor;
  final String? engAuthor;
  final String? authorUrl;

  DailyQuotaNoToken({
    required this.dailyQuoteSeq,
    this.korQuote,
    this.engQuote,
    this.korAuthor,
    this.engAuthor,
    this.authorUrl,
  });

  factory DailyQuotaNoToken.fromJson(Map<String, dynamic> json) =>
      _$DailyQuotaNoTokenFromJson(json);
  Map<String, dynamic> toJson() => _$DailyQuotaNoTokenToJson(this);
}
