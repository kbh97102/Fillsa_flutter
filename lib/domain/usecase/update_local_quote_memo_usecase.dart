import 'package:injectable/injectable.dart';

import '../model/local_quote_info.dart';
import '../repository/local_repository.dart';
import '../usecase/base_usecase.dart';

@lazySingleton
class FindLocalQuoteByIdUseCase extends UseCase<LocalQuoteInfo?, int> {
  final LocalRepository _localRepository;

  FindLocalQuoteByIdUseCase(this._localRepository);

  @override
  Future<LocalQuoteInfo?> call(int param) {
    return _localRepository.findLocalQuoteById(param);
  }
}
