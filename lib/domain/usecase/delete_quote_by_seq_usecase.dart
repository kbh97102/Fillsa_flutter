import 'package:injectable/injectable.dart';

import '../repository/local_repository.dart';
import '../usecase/base_usecase.dart';

@lazySingleton
class DeleteQuoteBySeqUseCase extends UseCase<void, int> {
  final LocalRepository _localRepository;

  DeleteQuoteBySeqUseCase(this._localRepository);

  @override
  Future<void> call([int? param]) {
    assert(param != null, 'Quote sequence cannot be null.');
    return _localRepository.deleteQuoteBySeq(param!);
  }
}
