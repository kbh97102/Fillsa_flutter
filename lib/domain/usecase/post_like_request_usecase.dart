import 'package:fillsa_flutter/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../model/request/post_like_params.dart';
import '../model/response/SimpleIntResponse.dart';
import '../repository/home_repository.dart';
import '../util/ApiResult.dart';

@lazySingleton
class PostLikeUseCase extends UseCase<SimpleIntResponse, PostLikeParams> {
  final HomeRepository _repository;

  PostLikeUseCase(this._repository);

  @override
  Future<ApiResult<SimpleIntResponse>> call(PostLikeParams params) {
    return _repository.postLike(params.likeRequest, params.dailyQuoteSeq);
  }
}
