import 'package:injectable/injectable.dart';

import '../model/local_quote_info.dart';
import '../repository/local_repository.dart';
import '../usecase/base_usecase.dart';

@lazySingleton
class GetLocalQuotesUseCase extends NoParamUseCase<List<LocalQuoteInfo>> {
  final LocalRepository _localRepository;

  GetLocalQuotesUseCase(this._localRepository);

  @override
  Future<List<LocalQuoteInfo>> call() {
    return _localRepository.getLocalQuotes();
  }
}
