// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MemberQuotesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberQuotesResponse _$MemberQuotesResponseFromJson(
  Map<String, dynamic> json,
) => MemberQuotesResponse(
  memberQuoteSeq: (json['memberQuoteSeq'] as num).toInt(),
  quoteDate: json['quoteDate'] as String,
  quoteDayOfWeek: json['quoteDayOfWeek'] as String,
  korQuote: json['korQuote'] as String?,
  engQuote: json['engQuote'] as String?,
  korAuthor: json['korAuthor'] as String?,
  engAuthor: json['engAuthor'] as String?,
  authorUrl: json['authorUrl'] as String,
  memo: json['memo'] as String?,
  memoYnString: json['memoYnString'] as String,
  likeYnString: json['likeYnString'] as String,
  imagePath: json['imagePath'] as String?,
);

Map<String, dynamic> _$MemberQuotesResponseToJson(
  MemberQuotesResponse instance,
) => <String, dynamic>{
  'memberQuoteSeq': instance.memberQuoteSeq,
  'quoteDate': instance.quoteDate,
  'quoteDayOfWeek': instance.quoteDayOfWeek,
  'korQuote': instance.korQuote,
  'engQuote': instance.engQuote,
  'korAuthor': instance.korAuthor,
  'engAuthor': instance.engAuthor,
  'authorUrl': instance.authorUrl,
  'memo': instance.memo,
  'memoYnString': instance.memoYnString,
  'likeYnString': instance.likeYnString,
  'imagePath': instance.imagePath,
};
