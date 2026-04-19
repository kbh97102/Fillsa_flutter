import 'package:fillsa_flutter/domain/repository/local_repository.dart';
import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAlarmUseCase extends NoParamUseCase<bool?> {
  final LocalRepository _localRepository;

  GetAlarmUseCase(this._localRepository);

  @override
  Future<bool?> call() {
    return _localRepository.getAlarm();
  }
}
