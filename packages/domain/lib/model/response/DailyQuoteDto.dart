import 'package:json_annotation/json_annotation.dart';

part 'DailyQuoteDto.g.dart';

@JsonSerializable()
class DailyQuoteDto {
  final String likeYn;
  final String? imagePath;
  final int dailyQuoteSeq;
  final String? korQuote;
  final String? engQuote;
  final String? korAuthor;
  final String? engAuthor;
  final String? authorUrl;

  const DailyQuoteDto({
    required this.likeYn,
    this.imagePath,
    required this.dailyQuoteSeq,
    this.korQuote,
    this.engQuote,
    this.korAuthor,
    this.engAuthor,
    this.authorUrl,
  });

  static const DailyQuoteDto empty = DailyQuoteDto(
    likeYn: '',
    dailyQuoteSeq: 0,
    imagePath: null,
    korQuote: null,
    engQuote: null,
    korAuthor: null,
    engAuthor: null,
    authorUrl: null,
  );

  factory DailyQuoteDto.fromJson(Map<String, dynamic> json) =>
      _$DailyQuoteDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DailyQuoteDtoToJson(this);
}
