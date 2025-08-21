import 'package:dio/dio.dart';
import 'package:domain/model/response/DailyQuotaNoToken.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'fillsa_api.g.dart';

@RestApi()
abstract class FillsaApi {
  factory FillsaApi(Dio dio, {required String baseUrl}) = _FillsaApi;

  @GET("/api/v1/quotes/daily") // 요청할 API
  Future<HttpResponse<DailyQuotaNoToken>> getDailyQuoteNonMember();
}
