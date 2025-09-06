// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../model/response/MonthlyQuoteResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthlyQuoteResponse _$MonthlyQuoteResponseFromJson(
  Map<String, dynamic> json,
) => MonthlyQuoteResponse(
  dailyQuoteSeq: (json['dailyQuoteSeq'] as num).toInt(),
  quoteDate: json['quoteDate'] as String,
  quote: json['quote'] as String,
  author: json['author'] as String,
);

Map<String, dynamic> _$MonthlyQuoteResponseToJson(
  MonthlyQuoteResponse instance,
) => <String, dynamic>{
  'dailyQuoteSeq': instance.dailyQuoteSeq,
  'quoteDate': instance.quoteDate,
  'quote': instance.quote,
  'author': instance.author,
};
