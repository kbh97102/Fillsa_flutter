import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_quote_info.freezed.dart';
part 'local_quote_info.g.dart';

@freezed
abstract class LocalQuoteInfo with _$LocalQuoteInfo {
  const factory LocalQuoteInfo({
    required int dailyQuoteSeq,
    required String korQuote,
    required String engQuote,
    required String korAuthor,
    required String engAuthor,
    required String korTyping,
    required String engTyping,
    required String likeYn,
    required String memo,
    required String date,
    required String dayOfWeek,
  }) = _LocalQuoteInfo;

  const LocalQuoteInfo._();

  factory LocalQuoteInfo.fromJson(Map<String, dynamic> json) =>
      _$LocalQuoteInfoFromJson(json);
}
