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
import 'package:fillsa_flutter/presentation/util/DateCondition.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/model/request/post_like_params.dart';
import '../../domain/model/response/DailyQuotaNoToken.dart';
import '../../domain/usecase/get_daily_quote_non_member_usecase.dart';

@injectable
class HomeViewModel extends AsyncNotifier<HomeState> {
  final GetDailyNonMemberUseCase _getDailyNonMemberUseCase;
  final GetLoginStatusUseCase _getLoginStatusUseCase;
  final PostLikeUseCase _postLikeUseCase;
  final FindLocalQuoteByIdUseCase _findLocalQuoteByIdUseCase;
  final UpdateLocalQuoteLikeUseCase _updateLocalQuoteLikeUseCase;
  final AddLocalQuoteUseCase _addLocalQuoteUseCase;

  late final StreamSubscription<bool?> _loginStatusSubscription;

  final DateFormat _dateRequestFormat = DateFormat("yyyy-MM-dd");

  @override
  FutureOr<HomeState> build() {
    ref.onDispose(() {
      _loginStatusSubscription.cancel();
    });

    getData().then((data) {
      state = AsyncValue.data(HomeState.initial().copyWith(data: data));
    });

    _loginStatusSubscription = _getLoginStatusUseCase().listen((status) {
      if (state.hasValue) {
        state = AsyncValue.data(
          state.requireValue.copyWith(isLogged: status == true),
        );
      } else {
        state = AsyncValue.data(
          HomeState.initial().copyWith(isLogged: status == true),
        );
      }
    });

    return HomeState.initial();
  }

  HomeViewModel(
    this._getDailyNonMemberUseCase,
    this._getLoginStatusUseCase,
    this._postLikeUseCase,
    this._findLocalQuoteByIdUseCase,
    this._updateLocalQuoteLikeUseCase,
    this._addLocalQuoteUseCase,
  ) {}

  // TODO: 아무리 생각해도 state와 연동을 하려면 APiResult는 쓸모없는 것 같다.
  Future<DailyQuoteDto> getData() async {
    final targetDate = state.hasValue
        ? state.requireValue.targetDate
        : DateTime.now();

    final requestDate = targetDate != null
        ? _dateRequestFormat.format(targetDate)
        : _dateRequestFormat.format(DateTime.now());

    final data = await _getDailyNonMemberUseCase.call(requestDate);

    final DailyQuotaNoToken noTokenDto = data;
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
    return uiQuote;
  }

  void postLike() async {
    final isLogged = state.requireValue.isLogged;

    if (isLogged) {
      final quote = state.requireValue.data;
      final String like = (state.requireValue.data.likeYn == YN.y.name)
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

  Future<void> beforeOnClick() async {
    final targetDate = state.requireValue.targetDate;

    if (targetDate != null) {
      final target = DateUtils.addDaysToDate(targetDate, -1);
      if (!target.isBefore(DateCondition.startDay)) {
        state = AsyncValue.data(
          state.requireValue.copyWith(targetDate: target),
        );
        state = await AsyncValue.guard(() async {
          final data = await getData();

          return state.requireValue.copyWith(data: data);
        });
      }
    }
  }

  void afterOnClick() async {
    final targetDate = state.requireValue.targetDate;

    if (targetDate != null) {
      final target = DateUtils.addDaysToDate(targetDate, 1);
      if (!target.isAfter(DateTime.now())) {
        state = AsyncValue.data(
          state.requireValue.copyWith(targetDate: target),
        );
        state = await AsyncValue.guard(() async {
          final data = await getData();

          return state.requireValue.copyWith(data: data);
        });
      }
    }
  }

  void _postLocalLike() async {
    final quote = state.requireValue.data;
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
}
