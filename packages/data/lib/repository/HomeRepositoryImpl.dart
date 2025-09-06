import 'dart:io';

import 'package:domain/model/request/like_request.dart';
import 'package:domain/model/response/DailyQuotaNoToken.dart';
import 'package:domain/model/response/DailyQuoteDto.dart';
import 'package:domain/model/response/SimpleIntResponse.dart';
import 'package:domain/repository/HomeRepository.dart';
import 'package:domain/util/ApiResult.dart';
import 'package:injectable/injectable.dart';

import '../../../../../lib/packages/data/lib/src/network/fillsa_api.dart';
import '../../../../../lib/packages/data/lib/src/network/fillsa_no_token_api.dart';
import '../../../../../lib/packages/data/lib/src/repository/base_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl with BaseRepository implements HomeRepository {
  final FillsaApi _api;
  final FillsaNoTokenApi _noTokenApi;
  HomeRepositoryImpl(this._api, this._noTokenApi);

  @override
  Future<ApiResult<int>> deleteUploadImage(int dailyQuoteSeq) async {
    return safeApiCall(() => _api.deleteUploadImage(dailyQuoteSeq));
  }

  @override
  Future<ApiResult<DailyQuoteDto>> getDailyQuote(String quoteDate) {
    return safeApiCall(() => _api.getDailyQuote(quoteDate));
  }

  @override
  Future<ApiResult<DailyQuotaNoToken>> getDailyQuoteNoToken(
    String quoteDate,
  ) async {
    return safeApiCall(() => _noTokenApi.getDailyQuoteNonMember(quoteDate));
  }

  @override
  Future<ApiResult<SimpleIntResponse>> postLike(
    LikeRequest likeRequest,
    int dailyQuoteSeq,
  ) {
    return safeApiCall(() => _api.postLike(dailyQuoteSeq, likeRequest));
  }

  @override
  Future<ApiResult<int>> postUploadImage(File imageFile, int dailyQuoteSeq) {
    return safeApiCall(() => _api.postUploadImage(dailyQuoteSeq, imageFile));
  }
}
