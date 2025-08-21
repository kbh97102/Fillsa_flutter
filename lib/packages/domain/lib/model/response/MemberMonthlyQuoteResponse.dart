import 'package:json_annotation/json_annotation.dart';

import 'MemberQuotesData.dart';
import 'MonthlySummaryData.dart';

part 'MemberMonthlyQuoteResponse.g.dart';

@JsonSerializable()
class MemberMonthlyQuoteResponse {
  final List<MemberQuotesData> memberQuotes;
  final MonthlySummaryData monthlySummary;

  MemberMonthlyQuoteResponse({
    required this.memberQuotes,
    required this.monthlySummary,
  });

  factory MemberMonthlyQuoteResponse.fromJson(Map<String, dynamic> json) =>
      _$MemberMonthlyQuoteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MemberMonthlyQuoteResponseToJson(this);
}
