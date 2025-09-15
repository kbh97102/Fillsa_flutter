import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/model/request/login_request.dart';
import '../../domain/model/response/DailyQuotaNoToken.dart';
import '../../domain/model/response/MonthlyQuoteResponse.dart';
import '../../domain/model/response/PageResponseNoticeResponse.dart';
import '../../domain/model/response/login_response.dart';
import '../util/api_end_point.dart';

part 'fillsa_no_token_api.g.dart';

@RestApi()
abstract class FillsaNoTokenApi {
  factory FillsaNoTokenApi(Dio dio, {String baseUrl}) = _FillsaNoTokenApi;

  @GET("/test/code/{code}")
  Future<HttpResponse<String>> testErrorCode(@Path("code") int code);

  @GET(ApiEndPoints.getDailyQuoteNonMember)
  Future<DailyQuotaNoToken> getDailyQuoteNonMember(
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
