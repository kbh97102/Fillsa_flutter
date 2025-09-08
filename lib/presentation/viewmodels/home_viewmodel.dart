import 'package:fillsa_flutter/domain/model/response/DailyQuoteDto.dart';
import 'package:fillsa_flutter/domain/usecase/get_login_status_usecase.dart';
import 'package:fillsa_flutter/presentation/state/HomeState.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/response/DailyQuotaNoToken.dart';
import '../../domain/usecase/get_daily_quote_non_member_usecase.dart';
import '../../domain/util/ApiResult.dart';
import '../util/logger.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  final GetDailyNonMemberUseCase _getDailyNonMemberUseCase;
  final GetLoginStatusUseCase _getLoginStatusUseCase;

  HomeState _state = const HomeState(data: DailyQuoteDto.empty);

  HomeState get state => _state;

  HomeViewModel(this._getDailyNonMemberUseCase, this._getLoginStatusUseCase) {
    getData();
    final test = _getLoginStatusUseCase.call().then(
      (login) => {logger.e("TestLogin Status $login")},
    );
  }

  void getData() async {
    final data = await _getDailyNonMemberUseCase.call("2025-08-29");

    if (data is ApiSuccess) {
      final DailyQuotaNoToken noTokenDto = (data as ApiSuccess).data;
      final uiQuote = DailyQuoteDto(
        likeYn: 'N',
        imagePath: "",
        dailyQuoteSeq: noTokenDto.dailyQuoteSeq,
        korQuote: noTokenDto.korQuote,
        engQuote: noTokenDto.engQuote,
        korAuthor: noTokenDto.korAuthor,
        engAuthor: noTokenDto.engAuthor,
        authorUrl: noTokenDto.authorUrl,
      );

      _state = state.copyWith(data: uiQuote);
    }
  }
}
