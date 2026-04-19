import '../model/api_result.dart';
import '../model/response/PageResponseNoticeResponse.dart';

abstract class MyPageRepository {
  Future<ApiResult<void>> withdraw();

  Future<ApiResult<PageResponseNoticeResponse>> getNotice({
    required int page,
    required int size,
  });
}
