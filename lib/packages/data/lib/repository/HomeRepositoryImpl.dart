import 'dart:io';

import 'package:domain/model/request/LikeRequest.dart';
import 'package:domain/model/response/DailyQuotaNoToken.dart';
import 'package:domain/model/response/DailyQuoteDto.dart';
import 'package:domain/model/response/SimpleIntResponse.dart';
import 'package:domain/repository/HomeRepository.dart';
import 'package:domain/util/ApiResult.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<ApiResult<int>> deleteUploadImage(int dailyQuoteSeq) async {
    return ApiSuccess(1);
  }

  @override
  Future<ApiResult<DailyQuoteDto>> getDailyQuote(String quoteDate) {
    // TODO: implement getDailyQuote
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<DailyQuotaNoToken>> getDailyQuoteNoToken(String quoteDate) {
    // TODO: implement getDailyQuoteNoToken
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<SimpleIntResponse>> postLike(
    LikeRequest likeRequest,
    int dailyQuoteSeq,
  ) {
    // TODO: implement postLike
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<int>> postUploadImage(File imageFile, int dailyQuoteSeq) {
    // TODO: implement postUploadImage
    throw UnimplementedError();
  }
}
