// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../model/response/MonthlySummaryData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthlySummaryData _$MonthlySummaryDataFromJson(Map<String, dynamic> json) =>
    MonthlySummaryData(
      typingCount: (json['typingCount'] as num).toInt(),
      likeCount: (json['likeCount'] as num).toInt(),
    );

Map<String, dynamic> _$MonthlySummaryDataToJson(MonthlySummaryData instance) =>
    <String, dynamic>{
      'typingCount': instance.typingCount,
      'likeCount': instance.likeCount,
    };
