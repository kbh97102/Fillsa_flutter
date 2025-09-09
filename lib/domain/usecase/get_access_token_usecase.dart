import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../repository/local_repository.dart';

@lazySingleton
class GetAccessTokenUseCase extends NoParamUseCase<String?> {
  final LocalRepository _localRepository;

  GetAccessTokenUseCase(this._localRepository);

  @override
  Future<String?> call() {
    return _localRepository.getAccessToken();
  }
}
