import 'package:injectable/injectable.dart';

import '../model/yn.dart';
import '../repository/local_repository.dart';
import '../usecase/base_usecase.dart';

typedef UpdateLikeParams = ({YN likeYN, int seq});

@lazySingleton
class UpdateLocalQuoteLikeUseCase extends BaseUseCase<int?, UpdateLikeParams> {
  final LocalRepository _localRepository;

  UpdateLocalQuoteLikeUseCase(this._localRepository);

  @override
  Future<int?> call([UpdateLikeParams? param]) {
    assert(param != null, 'Update like parameters cannot be null.');
    return _localRepository.updateLocalQuoteLike(
      likeYN: param!.likeYN,
      seq: param.seq,
    );
  }
}
