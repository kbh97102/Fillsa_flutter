import 'package:injectable/injectable.dart';

import '../repository/local_repository.dart';
import '../usecase/base_usecase.dart';

@lazySingleton
class ClearAllDataUseCase extends NoParamUseCase<void> {
  final LocalRepository _localRepository;

  ClearAllDataUseCase(this._localRepository);

  @override
  Future<void> call([void param]) {
    return _localRepository.clear();
  }
}
