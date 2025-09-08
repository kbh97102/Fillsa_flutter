import 'package:injectable/injectable.dart';

import '../repository/local_repository.dart';
import '../usecase/base_usecase.dart';

@lazySingleton
class GetRefreshTokenUseCase extends BaseUseCase<String?, void> {
  final LocalRepository _localRepository;

  GetRefreshTokenUseCase(this._localRepository);

  @override
  Future<String?> call([void param]) {
    return _localRepository.getRefreshToken();
  }
}
