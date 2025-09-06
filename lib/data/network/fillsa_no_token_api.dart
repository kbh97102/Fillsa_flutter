import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/request/login_request.dart';
import '../../domain/model/response/DailyQuotaNoToken.dart';
import '../../domain/model/response/LoginResponse.dart';
import '../../domain/model/response/MonthlyQuoteResponse.dart';
import '../../domain/model/response/PageResponseNoticeResponse.dart';
import '../util/api_end_point.dart';
import 'dio_provider.dart';

part 'fillsa_no_token_api.g.dart';

@RestApi()
abstract class FillsaNoTokenApi {
  // 4. Retrofit boilerplate: Dio 인스턴스를 받는 factory 생성자
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

@riverpod
FillsaNoTokenApi fillsaNoTokenApi(Ref ref) {
  final dio = ref.watch(dioProvider);
  return FillsaNoTokenApi(dio);
}
