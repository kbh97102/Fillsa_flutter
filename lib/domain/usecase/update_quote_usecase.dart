import 'package:injectable/injectable.dart';

import '../model/local_quote_info.dart';
import '../repository/local_repository.dart';
import '../usecase/base_usecase.dart';

@lazySingleton
class UpdateQuoteUseCase extends BaseUseCase<void, LocalQuoteInfo> {
  final LocalRepository _localRepository;

  UpdateQuoteUseCase(this._localRepository);

  @override
  Future<void> call([LocalQuoteInfo? param]) {
    assert(param != null, 'Quote info cannot be null.');
    return _localRepository.updateQuote(param!);
  }
}
