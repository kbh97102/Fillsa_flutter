import 'package:injectable/injectable.dart';

import '../repository/local_repository.dart';
import 'base_usecase.dart';

typedef UpdateMemoParams = ({String memo, int seq});

@lazySingleton
class UpdateLocalQuoteMemoUseCase extends UseCase<void, UpdateMemoParams> {
  final LocalRepository _localRepository;

  UpdateLocalQuoteMemoUseCase(this._localRepository);

  @override
  Future<void> call(UpdateMemoParams param) {
    return _localRepository.updateLocalQuoteMemo(
      memo: param.memo,
      seq: param.seq,
    );
  }
}
