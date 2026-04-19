import 'package:json_annotation/json_annotation.dart';

import 'MonthlyQuoteResponse.dart';
import '../local_quote_info.dart';

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

  bool get completed => typingYnString == 'Y';
  bool get isLiked => likeYnString == 'Y';

  factory MemberQuotesData.fromLocal({
    required MonthlyQuoteResponse quote,
    LocalQuoteInfo? localData,
  }) {
    final hasTyping = localData != null &&
        (localData.korTyping.isNotEmpty || localData.engTyping.isNotEmpty);
    return MemberQuotesData(
      dailyQuoteSeq: quote.dailyQuoteSeq,
      quoteDate: quote.quoteDate,
      quote: quote.quote,
      author: quote.author,
      typingYnString: hasTyping ? 'Y' : 'N',
      likeYnString: localData?.likeYn ?? 'N',
    );
  }

  factory MemberQuotesData.fromJson(Map<String, dynamic> json) => _$MemberQuotesDataFromJson(json);
  Map<String, dynamic> toJson() => _$MemberQuotesDataToJson(this);
}