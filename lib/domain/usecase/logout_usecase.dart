import 'package:fillsa_flutter/domain/repository/local_repository.dart';
import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LogoutUseCase extends NoParamUseCase<void> {
  final LocalRepository _localRepository;

  LogoutUseCase(this._localRepository);

  @override
  Future<void> call() {
    return _localRepository.logout();
  }
}
