import 'dart:io';

import '../model/request/LikeRequest.dart';
import '../model/response/DailyQuotaNoToken.dart';
import '../model/response/DailyQuoteDto.dart';
import '../model/response/SimpleIntResponse.dart';
import '../util/ApiResult.dart';

abstract class HomeRepository {
  Future<ApiResult<DailyQuotaNoToken>> getDailyQuoteNoToken(String quoteDate);

  Future<ApiResult<DailyQuoteDto>> getDailyQuote(String quoteDate);

  Future<ApiResult<SimpleIntResponse>> postLike(
    LikeRequest likeRequest,
    int dailyQuoteSeq,
  );

  Future<ApiResult<int>> postUploadImage(File imageFile, int dailyQuoteSeq);

  Future<ApiResult<int>> deleteUploadImage(int dailyQuoteSeq);
}
