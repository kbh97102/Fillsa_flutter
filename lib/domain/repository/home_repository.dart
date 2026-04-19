import 'dart:io';

import 'package:fillsa_flutter/domain/model/api_result.dart';

import '../model/request/like_request.dart';
import '../model/request/typing_quote_request.dart';
import '../model/response/DailyQuotaNoToken.dart';
import '../model/response/DailyQuoteDto.dart';
import '../model/response/MemberTypingQuoteResponse.dart';

abstract class HomeRepository {
  Future<ApiResult<DailyQuotaNoToken>> getDailyQuoteNoToken(String quoteDate);

  Future<ApiResult<DailyQuoteDto>> getDailyQuote(String quoteDate);

  Future<int> postLike(LikeRequest likeRequest, int dailyQuoteSeq);

  Future<int> postUploadImage(File imageFile, int dailyQuoteSeq);

  Future<int> deleteUploadImage(int dailyQuoteSeq);

  Future<void> postTyping(int dailyQuoteSeq, TypingQuoteRequest request);

  Future<MemberTypingQuoteResponse> getTyping(int dailyQuoteSeq);
}
