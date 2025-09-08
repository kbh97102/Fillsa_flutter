import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../repository/local_repository.dart';

@lazySingleton
class GetAccessTokenUseCase extends BaseUseCase<String?, void> {
  final LocalRepository _localRepository;

  GetAccessTokenUseCase(this._localRepository);

  @override
  Future<String?> call([void param]) {
    // 이 유스케이스는 파라미터를 사용하지 않습니다.
    return _localRepository.getAccessToken();
  }
}
