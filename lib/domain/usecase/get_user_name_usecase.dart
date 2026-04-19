import 'package:fillsa_flutter/domain/repository/local_repository.dart';
import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserNameUseCase extends NoParamUseCase<String?> {
  final LocalRepository _localRepository;

  GetUserNameUseCase(this._localRepository);

  @override
  Future<String?> call() {
    return _localRepository.getName();
  }
}
