// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MemberQuotesData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberQuotesData _$MemberQuotesDataFromJson(Map<String, dynamic> json) =>
    MemberQuotesData(
      dailyQuoteSeq: (json['dailyQuoteSeq'] as num).toInt(),
      quoteDate: json['quoteDate'] as String,
      quote: json['quote'] as String,
      author: json['author'] as String,
      typingYnString: json['typingYnString'] as String,
      likeYnString: json['likeYnString'] as String,
    );

Map<String, dynamic> _$MemberQuotesDataToJson(MemberQuotesData instance) =>
    <String, dynamic>{
      'dailyQuoteSeq': instance.dailyQuoteSeq,
      'quoteDate': instance.quoteDate,
      'quote': instance.quote,
      'author': instance.author,
      'typingYnString': instance.typingYnString,
      'likeYnString': instance.likeYnString,
    };
