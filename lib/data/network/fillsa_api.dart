import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../domain/model/request/like_request.dart';
import '../../domain/model/request/memo_request.dart';
import '../../domain/model/request/typing_quote_request.dart';
import '../../domain/model/response/DailyQuoteDto.dart';
import '../../domain/model/response/MemberMonthlyQuoteResponse.dart';
import '../../domain/model/response/MemberTypingQuoteResponse.dart';
import '../../domain/model/response/PageResponseMemberQuotesResponse.dart';
import '../../domain/model/response/SimpleIntResponse.dart';
import '../util/api_end_point.dart';

part 'fillsa_api.g.dart';

@RestApi()
abstract class FillsaApi {
  factory FillsaApi(Dio dio, {String baseUrl}) = _FillsaApi;

  @GET(ApiEndPoints.getDailyQuote)
  Future<HttpResponse<DailyQuoteDto>> getDailyQuote(
    @Query("quoteDate") String quoteDate,
  );

  @POST(ApiEndPoints.postLike)
  Future<int> postLike(
    @Path("dailyQuoteSeq") int dailyQuoteSeq,
    @Body() LikeRequest body,
  );

  @POST(ApiEndPoints.postUploadImage)
  Future<int> postUploadImage(
    @Path("dailyQuoteSeq") int dailyQuoteSeq,
    @Part() File image,
  );

  @DELETE(ApiEndPoints.deleteUploadImage)
  Future<int> deleteUploadImage(@Path("dailyQuoteSeq") int dailyQuoteSeq);

  @GET(ApiEndPoints.getQuoteList)
  Future<PageResponseMemberQuotesResponse> getQuoteList({
    @Query("size") required int size,
    @Query("page") required int page,
    @Query("likeYn") required String likeYn,
    @Query("startDate") required String startDate,
    @Query("endDate") required String endDate,
  });

  @POST(ApiEndPoints.postSaveMemo)
  Future<SimpleIntResponse> postSaveMemo(
    @Path("memberQuoteSeq") String memberQuoteSeq,
    @Body() MemoRequest body,
  );

  @GET(ApiEndPoints.getMemberMonthlyQuotes)
  Future<HttpResponse<MemberMonthlyQuoteResponse>> getQuotesMonthly(
    @Query("yearMonth") String yearMonth,
  );

  @DELETE(ApiEndPoints.deleteResign)
  Future<SimpleIntResponse> deleteResign();

  @POST(ApiEndPoints.postTyping)
  Future<void> postTyping(
    @Path("dailyQuoteSeq") int dailyQuoteSeq,
    @Body() TypingQuoteRequest body,
  );

  @GET(ApiEndPoints.getTyping)
  Future<MemberTypingQuoteResponse> getTyping(
    @Path("dailyQuoteSeq") int dailyQuoteSeq,
  );
}
