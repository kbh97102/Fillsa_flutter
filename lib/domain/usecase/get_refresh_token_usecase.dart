import 'package:injectable/injectable.dart';

import '../repository/local_repository.dart';
import '../usecase/base_usecase.dart';

@lazySingleton
class GetRefreshTokenUseCase extends NoParamUseCase<String?> {
  final LocalRepository _localRepository;

  GetRefreshTokenUseCase(this._localRepository);

  @override
  Future<String?> call() {
    return _localRepository.getRefreshToken();
  }
}
