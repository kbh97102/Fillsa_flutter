import 'package:json_annotation/json_annotation.dart';

part 'MemberTypingQuoteResponse.g.dart';

@JsonSerializable()
class MemberTypingQuoteResponse {
  final String? korQuote;
  final String? engQuote;
  final String? typingKorQuote;
  final String? typingEngQuote;
  final String likeYn;

  MemberTypingQuoteResponse({
    this.korQuote,
    this.engQuote,
    this.typingKorQuote,
    this.typingEngQuote,
    required this.likeYn,
  });

  factory MemberTypingQuoteResponse.fromJson(Map<String, dynamic> json) =>
      _$MemberTypingQuoteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MemberTypingQuoteResponseToJson(this);
}
