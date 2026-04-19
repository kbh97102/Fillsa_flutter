import 'package:fillsa_flutter/domain/repository/local_repository.dart';
import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetThemeModeUseCase extends NoParamUseCase<String?> {
  final LocalRepository _localRepository;

  GetThemeModeUseCase(this._localRepository);

  @override
  Future<String?> call() {
    return _localRepository.getThemeMode();
  }
}
