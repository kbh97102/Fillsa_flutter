import 'package:injectable/injectable.dart';

import '../repository/streak_repository.dart';
import 'base_usecase.dart';

@lazySingleton
class UpdateTodayStreakUseCase extends NoParamUseCase<void> {
  final StreakRepository _streakRepository;

  UpdateTodayStreakUseCase(this._streakRepository);

  @override
  Future<void> call() => _streakRepository.updateTodayStreak();
}
