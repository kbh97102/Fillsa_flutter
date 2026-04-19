import 'package:fillsa_flutter/domain/model/api_result.dart';
import 'package:fillsa_flutter/domain/model/response/PageResponseNoticeResponse.dart';
import 'package:fillsa_flutter/domain/repository/mypage_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetNoticeUseCase {
  final MyPageRepository _mypageRepository;

  GetNoticeUseCase(this._mypageRepository);

  Future<ApiResult<PageResponseNoticeResponse>> call({
    required int page,
    required int size,
  }) {
    return _mypageRepository.getNotice(page: page, size: size);
  }
}
