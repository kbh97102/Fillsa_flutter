// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MonthlySummaryData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthlySummaryData _$MonthlySummaryDataFromJson(Map<String, dynamic> json) =>
    MonthlySummaryData(
      typingCount: (json['typingCount'] as num).toInt(),
      likeCount: (json['likeCount'] as num).toInt(),
      streakCount: (json['streakCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MonthlySummaryDataToJson(MonthlySummaryData instance) =>
    <String, dynamic>{
      'typingCount': instance.typingCount,
      'likeCount': instance.likeCount,
      'streakCount': instance.streakCount,
    };
