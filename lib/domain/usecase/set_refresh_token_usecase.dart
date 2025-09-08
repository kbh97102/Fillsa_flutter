import 'package:injectable/injectable.dart';

import '../repository/local_repository.dart';
import '../usecase/base_usecase.dart';

@lazySingleton
class SetRefreshTokenUseCase extends BaseUseCase<void, String> {
  final LocalRepository _localRepository;

  SetRefreshTokenUseCase(this._localRepository);

  @override
  Future<void> call([String? param]) {
    return _localRepository.setRefreshToken(param ?? "");
  }
}
