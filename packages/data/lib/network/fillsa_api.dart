import 'dart:io';

import 'package:data/network/dio_provider.dart';
import 'package:data/util/api_end_point.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/request/like_request.dart';
import 'package:domain/model/request/memo_request.dart';
import 'package:domain/model/request/typing_quote_request.dart';
import 'package:domain/model/response/DailyQuotaNoToken.dart';
import 'package:domain/model/response/DailyQuoteDto.dart';
import 'package:domain/model/response/MemberMonthlyQuoteResponse.dart';
import 'package:domain/model/response/MemberTypingQuoteResponse.dart';
import 'package:domain/model/response/PageResponseMemberQuotesResponse.dart';
import 'package:domain/model/response/SimpleIntResponse.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fillsa_api.g.dart';

@RestApi()
abstract class FillsaApi {
  factory FillsaApi(Dio dio) = _FillsaApi;

  @GET(ApiEndPoints.getDailyQuote)
  Future<HttpResponse<DailyQuoteDto>> getDailyQuote(
    @Query("quoteDate") String quoteDate,
  );

  @POST(ApiEndPoints.postLike)
  Future<HttpResponse<SimpleIntResponse>> postLike(
    @Path("dailyQuoteSeq") int dailyQuoteSeq,
    @Body() LikeRequest body,
  );

  // @Multipart()
  @POST(ApiEndPoints.postUploadImage)
  Future<HttpResponse<int>> postUploadImage(
    @Path("dailyQuoteSeq") int dailyQuoteSeq,
    // Kotlin의 MultipartBody.Part는 Dart retrofit에서 보통 File로 처리됩니다.
    @Part() File image,
  );

  @DELETE(ApiEndPoints.deleteUploadImage)
  Future<HttpResponse<int>> deleteUploadImage(
    @Path("dailyQuoteSeq") int dailyQuoteSeq,
  );

  @GET(ApiEndPoints.getQuoteList)
  Future<HttpResponse<PageResponseMemberQuotesResponse>> getQuoteList(
  // 파라미터가 많을 경우, Dart의 명명된 파라미터(named parameters)를 사용하면 가독성이 좋습니다.
  {
    @Query("size") required int size,
    @Query("page") required int page,
    @Query("likeYn") required String likeYn,
    @Query("startDate") required String startDate,
    @Query("endDate") required String endDate,
  });

  @POST(ApiEndPoints.postSaveMemo)
  Future<HttpResponse<SimpleIntResponse>> postSaveMemo(
    @Path("memberQuoteSeq") String memberQuoteSeq,
    @Body() MemoRequest body,
  );

  @GET(ApiEndPoints.getMemberMonthlyQuotes)
  Future<HttpResponse<MemberMonthlyQuoteResponse>> getQuotesMonthly(
    @Query("yearMonth") String yearMonth,
  );

  @DELETE(ApiEndPoints.deleteResign)
  Future<HttpResponse<SimpleIntResponse>> deleteResign();

  @POST(ApiEndPoints.postTyping)
  Future<HttpResponse<SimpleIntResponse>> postTyping(
    @Path("dailyQuoteSeq") int dailyQuoteSeq,
    @Body() TypingQuoteRequest body,
  );

  @GET(ApiEndPoints.getTyping)
  Future<HttpResponse<MemberTypingQuoteResponse>> getTyping(
    @Path("dailyQuoteSeq") int dailyQuoteSeq,
  );
}

@riverpod
FillsaApi fillsaApi(Ref ref) {
  final dio = ref.watch(dioProvider);
  return FillsaApi(dio);
}
