import 'package:fillsa_flutter/domain/repository/local_repository.dart';
import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetUserNameUseCase extends UseCase<void, String> {
  final LocalRepository _localRepository;

  SetUserNameUseCase(this._localRepository);

  @override
  Future<void> call(String param) {
    return _localRepository.setName(param);
  }
}
