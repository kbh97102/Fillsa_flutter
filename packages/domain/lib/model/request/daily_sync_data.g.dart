// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../packages/domain/lib/model/request/daily_sync_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailySyncData _$DailySyncDataFromJson(Map<String, dynamic> json) =>
    DailySyncData(
      dailyQuoteSeq: (json['dailyQuoteSeq'] as num).toInt(),
      typingQuoteRequest: TypingQuoteRequest.fromJson(
        json['typingQuoteRequest'] as Map<String, dynamic>,
      ),
      memoRequest: MemoRequest.fromJson(
        json['memoRequest'] as Map<String, dynamic>,
      ),
      likeRequest: LikeRequest.fromJson(
        json['likeRequest'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$DailySyncDataToJson(DailySyncData instance) =>
    <String, dynamic>{
      'dailyQuoteSeq': instance.dailyQuoteSeq,
      'typingQuoteRequest': instance.typingQuoteRequest,
      'memoRequest': instance.memoRequest,
      'likeRequest': instance.likeRequest,
    };
