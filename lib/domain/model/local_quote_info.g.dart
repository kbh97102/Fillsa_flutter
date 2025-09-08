// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_quote_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalQuoteInfo _$LocalQuoteInfoFromJson(Map<String, dynamic> json) =>
    _LocalQuoteInfo(
      dailyQuoteSeq: (json['dailyQuoteSeq'] as num).toInt(),
      korQuote: json['korQuote'] as String,
      engQuote: json['engQuote'] as String,
      korAuthor: json['korAuthor'] as String,
      engAuthor: json['engAuthor'] as String,
      korTyping: json['korTyping'] as String,
      engTyping: json['engTyping'] as String,
      likeYn: json['likeYn'] as String,
      memo: json['memo'] as String,
      date: json['date'] as String,
      dayOfWeek: json['dayOfWeek'] as String,
    );

Map<String, dynamic> _$LocalQuoteInfoToJson(_LocalQuoteInfo instance) =>
    <String, dynamic>{
      'dailyQuoteSeq': instance.dailyQuoteSeq,
      'korQuote': instance.korQuote,
      'engQuote': instance.engQuote,
      'korAuthor': instance.korAuthor,
      'engAuthor': instance.engAuthor,
      'korTyping': instance.korTyping,
      'engTyping': instance.engTyping,
      'likeYn': instance.likeYn,
      'memo': instance.memo,
      'date': instance.date,
      'dayOfWeek': instance.dayOfWeek,
    };
