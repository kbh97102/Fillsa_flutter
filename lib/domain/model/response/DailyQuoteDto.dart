import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'DailyQuoteDto.g.dart';

const _sentinel = Object();

@injectable
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

  DailyQuoteDto copyWith({
    String? likeYn,
    Object? imagePath = _sentinel,
    int? dailyQuoteSeq,
    Object? korQuote = _sentinel,
    Object? engQuote = _sentinel,
    Object? korAuthor = _sentinel,
    Object? engAuthor = _sentinel,
    Object? authorUrl = _sentinel,
  }) {
    return DailyQuoteDto(
      likeYn: likeYn ?? this.likeYn,
      imagePath: imagePath == _sentinel ? this.imagePath : imagePath as String?,
      dailyQuoteSeq: dailyQuoteSeq ?? this.dailyQuoteSeq,
      korQuote: korQuote == _sentinel ? this.korQuote : korQuote as String?,
      engQuote: engQuote == _sentinel ? this.engQuote : engQuote as String?,
      korAuthor: korAuthor == _sentinel ? this.korAuthor : korAuthor as String?,
      engAuthor: engAuthor == _sentinel ? this.engAuthor : engAuthor as String?,
      authorUrl: authorUrl == _sentinel ? this.authorUrl : authorUrl as String?,
    );
  }

  factory DailyQuoteDto.fromJson(Map<String, dynamic> json) =>
      _$DailyQuoteDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DailyQuoteDtoToJson(this);
}
