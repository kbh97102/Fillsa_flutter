import 'package:fillsa_flutter/domain/repository/local_repository.dart';
import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetLoginStatusUseCase extends BaseUseCase<bool?, void> {
  final LocalRepository _localRepository;

  GetLoginStatusUseCase({required LocalRepository localRepository})
    : _localRepository = localRepository;

  @override
  Future<bool?> call([void param]) {
    return _localRepository.getLoginStatus();
  }
}
