import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../domain/model/api_result.dart';
import '../../domain/model/streak_info.dart';
import '../../domain/repository/local_repository.dart';
import '../../domain/repository/streak_repository.dart';
import '../local/local_database.dart';
import '../network/fillsa_api.dart';
import 'base_repository.dart';

@LazySingleton(as: StreakRepository)
class StreakRepositoryImpl with BaseRepository implements StreakRepository {
  final FillsaApi _api;
  final LocalDatabase _localDatabase;
  final LocalRepository _localRepository;

  StreakRepositoryImpl(this._api, this._localDatabase, this._localRepository);

  @override
  Future<StreakInfo> getStreakInfo() async {
    final token = await _localRepository.getAccessToken();
    if (token != null && token.isNotEmpty) {
      final result = await safeApiCall(() => _api.getMemberStreaks());
      return switch (result) {
        Success(:final data) => StreakInfo(
          currentStreak: data.currentStreak,
          isTodayWritten: data.isTodayWritten,
        ),
        Fail() => const StreakInfo(),
      };
    } else {
      return _getLocalStreakInfo();
    }
  }

  @override
  Future<void> updateTodayStreak() async {
    final today = _todayString();
    final yesterday = _yesterdayString();
    final yesterdayInfo = await _localDatabase.getStreakByDate(yesterday);

    final newCount = (yesterdayInfo?.isDailyWritingCompleted == true)
        ? yesterdayInfo!.streakDateCount + 1
        : 1;

    await _localDatabase.insertOrReplaceStreak(
      StreakInfoEntityCompanion.insert(
        date: today,
        streakDateCount: newCount,
        isDailyWritingCompleted: true,
      ),
    );
  }

  @override
  Future<void> checkYesterdayStreak() async {
    final today = _todayString();
    final yesterday = _yesterdayString();
    final yesterdayInfo = await _localDatabase.getStreakByDate(yesterday);

    if (yesterdayInfo != null && !yesterdayInfo.isDailyWritingCompleted) {
      await _localDatabase.insertOrReplaceStreak(
        StreakInfoEntityCompanion.insert(
          date: today,
          streakDateCount: 0,
          isDailyWritingCompleted: false,
        ),
      );
    }
  }

  Future<StreakInfo> _getLocalStreakInfo() async {
    final today = _todayString();
    final todayInfo = await _localDatabase.getStreakByDate(today);
    return StreakInfo(
      currentStreak: todayInfo?.streakDateCount ?? 0,
      isTodayWritten: todayInfo?.isDailyWritingCompleted ?? false,
    );
  }

  String _todayString() =>
      DateFormat('yyyy-MM-dd').format(DateTime.now());

  String _yesterdayString() =>
      DateFormat('yyyy-MM-dd').format(
        DateTime.now().subtract(const Duration(days: 1)),
      );
}
