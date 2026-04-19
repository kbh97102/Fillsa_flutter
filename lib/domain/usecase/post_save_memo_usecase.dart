import 'package:injectable/injectable.dart';

import '../model/api_result.dart';
import '../repository/list_repository.dart';
import '../model/response/SimpleIntResponse.dart';
import 'base_usecase.dart';

typedef SaveMemoParams = ({String memberQuoteSeq, String memo});

@lazySingleton
class PostSaveMemoUseCase
    extends ApiUseCase<SimpleIntResponse, SaveMemoParams> {
  final ListRepository _listRepository;

  PostSaveMemoUseCase(this._listRepository);

  @override
  Future<ApiResult<SimpleIntResponse>> call(SaveMemoParams param) {
    return _listRepository.saveMemo(
      memberQuoteSeq: param.memberQuoteSeq,
      memo: param.memo,
    );
  }
}
