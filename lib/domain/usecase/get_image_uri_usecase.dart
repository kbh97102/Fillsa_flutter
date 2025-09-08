import 'package:injectable/injectable.dart';

import '../repository/local_repository.dart';
import '../usecase/base_usecase.dart';

@lazySingleton
class GetImageUriUseCase extends BaseUseCase<String?, void> {
  final LocalRepository _localRepository;

  GetImageUriUseCase(this._localRepository);

  @override
  Future<String?> call([void param]) {
    return _localRepository.getImageUri();
  }
}
