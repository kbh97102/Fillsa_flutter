import 'package:json_annotation/json_annotation.dart';

part 'MonthlyQuoteResponse.g.dart';

@JsonSerializable()
class MonthlyQuoteResponse {
  final int dailyQuoteSeq;
  final String quoteDate;
  final String quote;
  final String author;

  MonthlyQuoteResponse({
    required this.dailyQuoteSeq,
    required this.quoteDate,
    required this.quote,
    required this.author,
  });

  factory MonthlyQuoteResponse.fromJson(Map<String, dynamic> json) =>
      _$MonthlyQuoteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MonthlyQuoteResponseToJson(this);
}
