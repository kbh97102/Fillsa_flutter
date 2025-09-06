import 'package:json_annotation/json_annotation.dart';

part 'typing_quote_request.g.dart';

@JsonSerializable()
class TypingQuoteRequest {
  @JsonKey(name: 'typingKorQuote')
  final String typingKorQuote;

  @JsonKey(name: 'typingEngQuote')
  final String typingEngQuote;

  TypingQuoteRequest({
    required this.typingKorQuote,
    required this.typingEngQuote,
  });

  factory TypingQuoteRequest.fromJson(Map<String, dynamic> json) =>
      _$TypingQuoteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TypingQuoteRequestToJson(this);
}
