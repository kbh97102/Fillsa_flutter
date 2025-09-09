import 'dart:io';

import '../model/request/like_request.dart';
import '../model/response/DailyQuotaNoToken.dart';
import '../model/response/DailyQuoteDto.dart';
import '../model/response/SimpleIntResponse.dart';

abstract class HomeRepository {
  Future<DailyQuotaNoToken> getDailyQuoteNoToken(String quoteDate);

  Future<DailyQuoteDto> getDailyQuote(String quoteDate);

  Future<SimpleIntResponse> postLike(
    LikeRequest likeRequest,
    int dailyQuoteSeq,
  );

  Future<int> postUploadImage(File imageFile, int dailyQuoteSeq);

  Future<int> deleteUploadImage(int dailyQuoteSeq);
}
