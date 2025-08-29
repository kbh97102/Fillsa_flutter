import 'package:domain/model/response/SimpleIntResponse.dart';
import 'package:domain/repository/HomeRepository.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:domain/util/ApiResult.dart';

import '../model/request/post_like_params.dart';

class PostLikeUseCase extends UseCase<SimpleIntResponse, PostLikeParams> {
  final HomeRepository _repository;

  PostLikeUseCase(this._repository);

  @override
  Future<ApiResult<SimpleIntResponse>> call(PostLikeParams params) {
    return _repository.postLike(params.likeRequest, params.dailyQuoteSeq);
  }
}
