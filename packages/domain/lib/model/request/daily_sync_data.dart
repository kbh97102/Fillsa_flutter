import 'package:json_annotation/json_annotation.dart';

import 'memo_request.dart';
import 'typing_quote_request.dart';
import 'like_request.dart';

part 'daily_sync_data.g.dart';

@JsonSerializable()
class DailySyncData {
  @JsonKey(name: 'dailyQuoteSeq')
  final int dailyQuoteSeq;

  @JsonKey(name: 'typingQuoteRequest')
  final TypingQuoteRequest typingQuoteRequest;

  @JsonKey(name: 'memoRequest')
  final MemoRequest memoRequest;

  @JsonKey(name: 'likeRequest')
  final LikeRequest likeRequest;

  DailySyncData({
    required this.dailyQuoteSeq,
    required this.typingQuoteRequest,
    required this.memoRequest,
    required this.likeRequest,
  });

  factory DailySyncData.fromJson(Map<String, dynamic> json) =>
      _$DailySyncDataFromJson(json);
  Map<String, dynamic> toJson() => _$DailySyncDataToJson(this);
}
