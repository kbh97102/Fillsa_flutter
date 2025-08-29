import 'dart:io';

import 'package:data/network/fillsa_api.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/request/LikeRequest.dart';
import 'package:domain/model/response/DailyQuotaNoToken.dart';
import 'package:domain/model/response/DailyQuoteDto.dart';
import 'package:domain/model/response/ErrorResponse.dart';
import 'package:domain/model/response/SimpleIntResponse.dart';
import 'package:domain/repository/HomeRepository.dart';
import 'package:domain/util/ApiResult.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'HomeRepositoryImpl.g.dart';

class HomeRepositoryImpl extends HomeRepository {
  final FillsaApi _api;
  HomeRepositoryImpl(this._api);

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
  Future<ApiResult<DailyQuotaNoToken>> getDailyQuoteNoToken(
    String quoteDate,
  ) async {
    try {
      var test = await _api.getDailyQuoteNonMember();

      final statusCode = test.response.statusCode;

      if (statusCode != null && statusCode <= 299 && statusCode >= 200) {
        return ApiSuccess(test.data);
      } else {
        // TODO: ErrorResponse 처리부 공통화하기
        return ApiFail(
          ErrorResponse(
            timestamp: "",
            errorCode: 0,
            httpStatus: 0,
            message: "",
          ),
        );
      }
    } on DioException catch (e) {
      return ApiError(e);
    }
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

@riverpod
HomeRepository homeRepository(Ref ref) {
  final api = ref.watch(fillsaApiProvider);

  return HomeRepositoryImpl(api);
}
