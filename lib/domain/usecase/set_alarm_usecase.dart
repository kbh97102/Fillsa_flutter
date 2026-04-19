import 'package:fillsa_flutter/domain/repository/local_repository.dart';
import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetAlarmUseCase extends UseCase<void, bool> {
  final LocalRepository _localRepository;

  SetAlarmUseCase(this._localRepository);

  @override
  Future<void> call(bool param) {
    return _localRepository.setAlarm(param);
  }
}
