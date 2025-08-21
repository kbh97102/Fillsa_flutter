// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MemberTypingQuoteResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberTypingQuoteResponse _$MemberTypingQuoteResponseFromJson(
  Map<String, dynamic> json,
) => MemberTypingQuoteResponse(
  korQuote: json['korQuote'] as String?,
  engQuote: json['engQuote'] as String?,
  typingKorQuote: json['typingKorQuote'] as String?,
  typingEngQuote: json['typingEngQuote'] as String?,
  likeYn: json['likeYn'] as String,
);

Map<String, dynamic> _$MemberTypingQuoteResponseToJson(
  MemberTypingQuoteResponse instance,
) => <String, dynamic>{
  'korQuote': instance.korQuote,
  'engQuote': instance.engQuote,
  'typingKorQuote': instance.typingKorQuote,
  'typingEngQuote': instance.typingEngQuote,
  'likeYn': instance.likeYn,
};
