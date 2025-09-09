import 'package:injectable/injectable.dart';

import '../model/local_quote_info.dart';
import '../model/yn.dart';
import '../repository/local_repository.dart';
import '../usecase/base_usecase.dart';

typedef GetPagingParams = ({
  YN likeYN,
  String startDate,
  String endDate,
  int page,
  int size,
});

@lazySingleton
class GetLocalQuotesPagingUseCase
    extends UseCase<List<LocalQuoteInfo>, GetPagingParams> {
  final LocalRepository _localRepository;

  GetLocalQuotesPagingUseCase(this._localRepository);

  @override
  Future<List<LocalQuoteInfo>> call([GetPagingParams? param]) {
    assert(param != null, 'Paging parameters cannot be null.');
    return _localRepository.getLocalQuotesPaging(
      likeYN: param!.likeYN,
      startDate: param.startDate,
      endDate: param.endDate,
      page: param.page,
      size: param.size,
    );
  }
}
