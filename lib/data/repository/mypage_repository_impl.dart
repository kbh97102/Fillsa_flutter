import 'package:fillsa_flutter/data/network/fillsa_api.dart';
import 'package:fillsa_flutter/data/network/fillsa_no_token_api.dart';
import 'package:fillsa_flutter/data/repository/base_repository.dart';
import 'package:fillsa_flutter/domain/model/api_result.dart';
import 'package:fillsa_flutter/domain/model/response/PageResponseNoticeResponse.dart';
import 'package:fillsa_flutter/domain/repository/mypage_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MyPageRepository)
class MyPageRepositoryImpl extends MyPageRepository with BaseRepository {
  final FillsaApi _api;
  final FillsaNoTokenApi _noTokenApi;

  MyPageRepositoryImpl(this._api, this._noTokenApi);

  @override
  Future<ApiResult<void>> withdraw() {
    return safeCall(() => _api.deleteResign());
  }

  @override
  Future<ApiResult<PageResponseNoticeResponse>> getNotice({
    required int page,
    required int size,
  }) {
    return safeApiCall(() => _noTokenApi.getNotice(page: page, size: size));
  }
}
