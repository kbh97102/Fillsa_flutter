// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_streak_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberStreakResponse _$MemberStreakResponseFromJson(
  Map<String, dynamic> json,
) => MemberStreakResponse(
  currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
  isTodayWritten: json['isTodayWritten'] as bool? ?? false,
);

Map<String, dynamic> _$MemberStreakResponseToJson(
  MemberStreakResponse instance,
) => <String, dynamic>{
  'currentStreak': instance.currentStreak,
  'isTodayWritten': instance.isTodayWritten,
};
