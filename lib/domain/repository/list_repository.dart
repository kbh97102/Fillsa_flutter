import '../model/api_result.dart';
import '../model/response/PageResponseMemberQuotesResponse.dart';
import '../model/response/SimpleIntResponse.dart';

abstract class ListRepository {
  Future<ApiResult<PageResponseMemberQuotesResponse>> getQuotesList({
    required int size,
    required int page,
    required String likeYn,
    required String startDate,
    required String endDate,
  });

  Future<ApiResult<SimpleIntResponse>> saveMemo({
    required String memberQuoteSeq,
    required String memo,
  });
}
