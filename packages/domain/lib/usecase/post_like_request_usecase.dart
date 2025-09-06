import 'package:injectable/injectable.dart';

import '../model/request/post_like_params.dart';
import '../model/response/SimpleIntResponse.dart';
import '../repository/HomeRepository.dart';
import '../util/ApiResult.dart';
import 'usecase.dart';

@lazySingleton
class PostLikeUseCase extends UseCase<SimpleIntResponse, PostLikeParams> {
  final HomeRepository _repository;

  PostLikeUseCase(this._repository);

  @override
  Future<ApiResult<SimpleIntResponse>> call(PostLikeParams params) {
    return _repository.postLike(params.likeRequest, params.dailyQuoteSeq);
  }
}
