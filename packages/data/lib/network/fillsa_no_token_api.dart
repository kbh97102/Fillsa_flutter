import 'package:dio/dio.dart';
import 'package:domain/model/request/login_request.dart';
import 'package:domain/model/response/DailyQuotaNoToken.dart';
import 'package:domain/model/response/LoginResponse.dart';
import 'package:domain/model/response/MonthlyQuoteResponse.dart';
import 'package:domain/model/response/PageResponseNoticeResponse.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../lib/packages/data/lib/src/util/api_end_point.dart';

part 'fillsa_no_token_api.g.dart';

@RestApi()
abstract class FillsaNoTokenApi {
  factory FillsaNoTokenApi(Dio dio, {String baseUrl}) = _FillsaNoTokenApi;

  @GET(ApiEndPoints.getDailyQuoteNonMember)
  Future<HttpResponse<DailyQuotaNoToken>> getDailyQuoteNonMember(
    @Query("quoteDate") String quoteDate,
  );

  @POST(ApiEndPoints.login)
  Future<HttpResponse<LoginResponse>> login(@Body() LoginRequest loginRequest);

  @GET(ApiEndPoints.getNotice)
  Future<HttpResponse<PageResponseNoticeResponse>> getNotice({
    @Query("size") required int size,
    @Query("page") required int page,
  });

  @GET(ApiEndPoints.getMonthlyQuotes)
  Future<HttpResponse<List<MonthlyQuoteResponse>>> getMonthlyQuotesNonMember(
    @Query("yearMonth") String yearMonth,
  );
}
