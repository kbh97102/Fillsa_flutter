import 'package:injectable/injectable.dart';

import '../../domain/model/api_result.dart';
import '../../domain/model/request/memo_request.dart';
import '../../domain/model/response/PageResponseMemberQuotesResponse.dart';
import '../../domain/model/response/SimpleIntResponse.dart';
import '../../domain/repository/list_repository.dart';
import '../network/fillsa_api.dart';
import 'base_repository.dart';

@LazySingleton(as: ListRepository)
class ListRepositoryImpl with BaseRepository implements ListRepository {
  final FillsaApi _api;

  ListRepositoryImpl(this._api);

  @override
  Future<ApiResult<PageResponseMemberQuotesResponse>> getQuotesList({
    required int size,
    required int page,
    required String likeYn,
    required String startDate,
    required String endDate,
  }) {
    return safeCall(
      () => _api.getQuoteList(
        size: size,
        page: page,
        likeYn: likeYn,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  Future<ApiResult<SimpleIntResponse>> saveMemo({
    required String memberQuoteSeq,
    required String memo,
  }) {
    return safeCall(
      () => _api.postSaveMemo(memberQuoteSeq, MemoRequest(memo: memo)),
    );
  }
}
