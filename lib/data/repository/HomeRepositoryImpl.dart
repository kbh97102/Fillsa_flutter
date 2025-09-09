import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../domain/model/request/like_request.dart';
import '../../domain/model/response/DailyQuotaNoToken.dart';
import '../../domain/model/response/DailyQuoteDto.dart';
import '../../domain/model/response/SimpleIntResponse.dart';
import '../../domain/repository/home_repository.dart';
import '../network/fillsa_api.dart';
import '../network/fillsa_no_token_api.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final FillsaApi _api;
  final FillsaNoTokenApi _noTokenApi;
  HomeRepositoryImpl(this._api, this._noTokenApi);

  @override
  Future<int> deleteUploadImage(int dailyQuoteSeq) async {
    return _api.deleteUploadImage(dailyQuoteSeq);
  }

  @override
  Future<DailyQuoteDto> getDailyQuote(String quoteDate) {
    return _api.getDailyQuote(quoteDate);
  }

  @override
  Future<DailyQuotaNoToken> getDailyQuoteNoToken(String quoteDate) async {
    return _noTokenApi.getDailyQuoteNonMember(quoteDate);
  }

  @override
  Future<SimpleIntResponse> postLike(
    LikeRequest likeRequest,
    int dailyQuoteSeq,
  ) {
    return _api.postLike(dailyQuoteSeq, likeRequest);
  }

  @override
  Future<int> postUploadImage(File imageFile, int dailyQuoteSeq) {
    return _api.postUploadImage(dailyQuoteSeq, imageFile);
  }
}
