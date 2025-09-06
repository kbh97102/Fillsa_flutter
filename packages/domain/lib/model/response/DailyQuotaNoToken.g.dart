// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../model/response/DailyQuotaNoToken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyQuotaNoToken _$DailyQuotaNoTokenFromJson(Map<String, dynamic> json) =>
    DailyQuotaNoToken(
      dailyQuoteSeq: (json['dailyQuoteSeq'] as num).toInt(),
      korQuote: json['korQuote'] as String?,
      engQuote: json['engQuote'] as String?,
      korAuthor: json['korAuthor'] as String?,
      engAuthor: json['engAuthor'] as String?,
      authorUrl: json['authorUrl'] as String?,
    );

Map<String, dynamic> _$DailyQuotaNoTokenToJson(DailyQuotaNoToken instance) =>
    <String, dynamic>{
      'dailyQuoteSeq': instance.dailyQuoteSeq,
      'korQuote': instance.korQuote,
      'engQuote': instance.engQuote,
      'korAuthor': instance.korAuthor,
      'engAuthor': instance.engAuthor,
      'authorUrl': instance.authorUrl,
    };
