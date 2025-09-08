import 'dart:async';

import 'package:fillsa_flutter/domain/model/local_quote_info.dart';
import 'package:fillsa_flutter/domain/model/request/like_request.dart';
import 'package:fillsa_flutter/domain/model/response/DailyQuoteDto.dart';
import 'package:fillsa_flutter/domain/model/yn.dart';
import 'package:fillsa_flutter/domain/usecase/add_local_quote_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/find_local_quote_by_id_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/get_login_status_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/post_like_request_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/update_local_quote_like_usecase.dart';
import 'package:fillsa_flutter/presentation/state/HomeState.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../domain/model/request/post_like_params.dart';
import '../../domain/model/response/DailyQuotaNoToken.dart';
import '../../domain/usecase/get_daily_quote_non_member_usecase.dart';
import '../../domain/util/ApiResult.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  final GetDailyNonMemberUseCase _getDailyNonMemberUseCase;
  final GetLoginStatusUseCase _getLoginStatusUseCase;
  final PostLikeUseCase _postLikeUseCase;
  final FindLocalQuoteByIdUseCase _findLocalQuoteByIdUseCase;
  final UpdateLocalQuoteLikeUseCase _updateLocalQuoteLikeUseCase;
  final AddLocalQuoteUseCase _addLocalQuoteUseCase;

  late final StreamSubscription<bool?> _loginStatusSubscription;

  HomeState _state = const HomeState(data: DailyQuoteDto.empty);

  HomeState get state => _state;

  HomeViewModel(
    this._getDailyNonMemberUseCase,
    this._getLoginStatusUseCase,
    this._postLikeUseCase,
    this._findLocalQuoteByIdUseCase,
    this._updateLocalQuoteLikeUseCase,
    this._addLocalQuoteUseCase,
  ) {
    getData();
    _loginStatusSubscription = _getLoginStatusUseCase().listen((status) {
      _state = state.copyWith(isLogged: status == true);
      notifyListeners();
    });
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

  void postLike() async {
    final isLogged = state.isLogged;

    if (isLogged) {
      final quote = state.data;
      final String like = (state.currentQuote?.likeYn == YN.y.name)
          ? YN.y.name
          : YN.n.name;

      _postLikeUseCase.call(
        PostLikeParams(
          dailyQuoteSeq: quote.dailyQuoteSeq,
          likeRequest: LikeRequest(likeYn: like),
        ),
      );
    } else {
      _postLocalLike();
    }
  }

  void beforeOnClick() {}

  void afterOnClick() {}

  void _postLocalLike() async {
    final quote = state.data;
    final localQuote = await _findLocalQuoteByIdUseCase.call(
      quote.dailyQuoteSeq,
    );
    if (localQuote != null) {
      _updateLocalQuoteLikeUseCase.call((
        likeYN: (localQuote.likeYn == YN.y.name ? YN.y : YN.n),
        seq: localQuote.dailyQuoteSeq,
      ));
    } else {
      // TODO: 선택된 명언의 날짜로 변경
      final now = DateTime.now();
      _addLocalQuoteUseCase.call(
        LocalQuoteInfo(
          dailyQuoteSeq: quote.dailyQuoteSeq,
          korQuote: quote.korQuote ?? "",
          engQuote: quote.engQuote ?? "",
          korAuthor: quote.korAuthor ?? "",
          engAuthor: quote.engAuthor ?? "",
          korTyping: "",
          engTyping: "",
          likeYn: YN.y.name,
          memo: "",
          date: now,
          dayOfWeek: DateFormat('E', 'ko_KR').format(now),
        ),
      );
    }
  }

  @override
  void dispose() {
    _loginStatusSubscription.cancel();
    super.dispose();
  }
}
