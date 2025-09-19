import 'dart:io';

import 'package:fillsa_flutter/data/repository/base_repository.dart';
import 'package:fillsa_flutter/domain/model/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/request/like_request.dart';
import '../../domain/model/response/DailyQuotaNoToken.dart';
import '../../domain/model/response/DailyQuoteDto.dart';
import '../../domain/repository/home_repository.dart';
import '../network/fillsa_api.dart';
import '../network/fillsa_no_token_api.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl with BaseRepository implements HomeRepository {
  final FillsaApi _api;
  final FillsaNoTokenApi _noTokenApi;
  HomeRepositoryImpl(this._api, this._noTokenApi);

  @override
  Future<int> deleteUploadImage(int dailyQuoteSeq) async {
    return _api.deleteUploadImage(dailyQuoteSeq);
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
  Future<int> postLike(LikeRequest likeRequest, int dailyQuoteSeq) {
    return _api.postLike(dailyQuoteSeq, likeRequest);
  }

  @override
  Future<int> postUploadImage(File imageFile, int dailyQuoteSeq) {
    return _api.postUploadImage(dailyQuoteSeq, imageFile);
  }
}
