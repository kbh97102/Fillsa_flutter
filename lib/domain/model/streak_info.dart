import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_info.freezed.dart';

@freezed
abstract class StreakInfo with _$StreakInfo {
  const factory StreakInfo({
    @Default(0) int currentStreak,
    @Default(false) bool isTodayWritten,
    @Default(0) int maxStreak,
  }) = _StreakInfo;
}
