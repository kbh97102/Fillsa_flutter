import 'package:injectable/injectable.dart';

import '../repository/local_repository.dart';
import '../usecase/base_usecase.dart';

@lazySingleton
class IsFirstOpenUseCase extends NoParamUseCase<bool?> {
  final LocalRepository _localRepository;

  IsFirstOpenUseCase(this._localRepository);

  @override
  Future<bool?> call() {
    return _localRepository.isFirstOpen();
  }
}
