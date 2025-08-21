// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MemberMonthlyQuoteResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberMonthlyQuoteResponse _$MemberMonthlyQuoteResponseFromJson(
  Map<String, dynamic> json,
) => MemberMonthlyQuoteResponse(
  memberQuotes:
      (json['memberQuotes'] as List<dynamic>)
          .map((e) => MemberQuotesData.fromJson(e as Map<String, dynamic>))
          .toList(),
  monthlySummary: MonthlySummaryData.fromJson(
    json['monthlySummary'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$MemberMonthlyQuoteResponseToJson(
  MemberMonthlyQuoteResponse instance,
) => <String, dynamic>{
  'memberQuotes': instance.memberQuotes,
  'monthlySummary': instance.monthlySummary,
};
