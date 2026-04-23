import 'package:injectable/injectable.dart';

import '../model/streak_info.dart';
import '../repository/streak_repository.dart';
import 'base_usecase.dart';

@lazySingleton
class GetStreakInfoUseCase extends NoParamUseCase<StreakInfo> {
  final StreakRepository _streakRepository;

  GetStreakInfoUseCase(this._streakRepository);

  @override
  Future<StreakInfo> call() => _streakRepository.getStreakInfo();
}
