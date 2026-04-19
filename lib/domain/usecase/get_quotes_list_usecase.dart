import 'package:injectable/injectable.dart';

import '../model/api_result.dart';
import '../model/yn.dart';
import '../repository/list_repository.dart';
import '../model/response/PageResponseMemberQuotesResponse.dart';
import 'base_usecase.dart';

typedef GetQuotesListParams = ({
  YN likeYN,
  String startDate,
  String endDate,
  int page,
  int size,
});

@lazySingleton
class GetQuotesListUseCase
    extends ApiUseCase<PageResponseMemberQuotesResponse, GetQuotesListParams> {
  final ListRepository _listRepository;

  GetQuotesListUseCase(this._listRepository);

  @override
  Future<ApiResult<PageResponseMemberQuotesResponse>> call(
    GetQuotesListParams param,
  ) {
    return _listRepository.getQuotesList(
      size: param.size,
      page: param.page,
      likeYn: param.likeYN.name,
      startDate: param.startDate,
      endDate: param.endDate,
    );
  }
}
