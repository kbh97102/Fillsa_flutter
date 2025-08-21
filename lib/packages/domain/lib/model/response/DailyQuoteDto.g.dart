// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DailyQuoteDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyQuoteDto _$DailyQuoteDtoFromJson(Map<String, dynamic> json) =>
    DailyQuoteDto(
      likeYn: json['likeYn'] as String,
      imagePath: json['imagePath'] as String?,
      dailyQuoteSeq: (json['dailyQuoteSeq'] as num).toInt(),
      korQuote: json['korQuote'] as String?,
      engQuote: json['engQuote'] as String?,
      korAuthor: json['korAuthor'] as String?,
      engAuthor: json['engAuthor'] as String?,
      authorUrl: json['authorUrl'] as String?,
    );

Map<String, dynamic> _$DailyQuoteDtoToJson(DailyQuoteDto instance) =>
    <String, dynamic>{
      'likeYn': instance.likeYn,
      'imagePath': instance.imagePath,
      'dailyQuoteSeq': instance.dailyQuoteSeq,
      'korQuote': instance.korQuote,
      'engQuote': instance.engQuote,
      'korAuthor': instance.korAuthor,
      'engAuthor': instance.engAuthor,
      'authorUrl': instance.authorUrl,
    };
