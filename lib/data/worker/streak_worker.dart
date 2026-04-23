import 'package:workmanager/workmanager.dart';

const _streakCheckTaskName = 'streakYesterdayCheck';
const _streakCheckTaskUniqueName = 'fillsa_streak_check';

// Top-level function required by WorkManager
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    if (taskName == _streakCheckTaskName) {
      // DI가 초기화되지 않은 별도 isolate이므로 직접 DB를 다룰 수 없어
      // 앱 실행 시 HomeViewModel.build()의 checkYesterdayStreak()이 대신 처리한다.
      // Worker는 OS가 앱을 깨울 때 트리거 역할만 수행한다.
    }
    return Future.value(true);
  });
}

class StreakWorker {
  static Future<void> initialize() async {
    await Workmanager().initialize(callbackDispatcher);
  }

  static Future<void> registerPeriodicTask() async {
    await Workmanager().registerPeriodicTask(
      _streakCheckTaskUniqueName,
      _streakCheckTaskName,
      frequency: const Duration(hours: 24),
      initialDelay: _initialDelayUntilMidnightThirty(),
      existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
      constraints: Constraints(networkType: NetworkType.notRequired),
    );
  }

  static Duration _initialDelayUntilMidnightThirty() {
    final now = DateTime.now();
    var target = DateTime(now.year, now.month, now.day, 0, 30);
    if (!target.isAfter(now)) {
      target = target.add(const Duration(days: 1));
    }
    return target.difference(now);
  }
}
