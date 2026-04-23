import 'package:injectable/injectable.dart';

import '../repository/streak_repository.dart';
import 'base_usecase.dart';

@lazySingleton
class CheckYesterdayStreakUseCase extends NoParamUseCase<void> {
  final StreakRepository _streakRepository;

  CheckYesterdayStreakUseCase(this._streakRepository);

  @override
  Future<void> call() => _streakRepository.checkYesterdayStreak();
}
