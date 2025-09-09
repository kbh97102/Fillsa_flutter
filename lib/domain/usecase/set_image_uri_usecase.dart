import 'package:injectable/injectable.dart';

import '../repository/local_repository.dart';
import '../usecase/base_usecase.dart';

@lazySingleton
class SetImageUriUseCase extends UseCase<void, String> {
  final LocalRepository _localRepository;

  SetImageUriUseCase(this._localRepository);

  @override
  Future<void> call(String param) {
    return _localRepository.setImageUri(param ?? "");
  }
}
