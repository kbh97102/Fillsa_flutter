import 'package:injectable/injectable.dart';

import '../repository/local_repository.dart';
import '../usecase/base_usecase.dart';

@lazySingleton
class SetFirstOpenUseCase extends BaseUseCase<void, bool> {
  final LocalRepository _localRepository;

  SetFirstOpenUseCase(this._localRepository);

  @override
  Future<void> call([bool? param]) {
    return _localRepository.setFirstOpen(param ?? false);
  }
}
