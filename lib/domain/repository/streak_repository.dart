import '../model/streak_info.dart';

abstract class StreakRepository {
  Future<StreakInfo> getStreakInfo();

  Future<void> updateTodayStreak();

  Future<void> checkYesterdayStreak();
}
