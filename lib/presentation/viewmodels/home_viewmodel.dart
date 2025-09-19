import 'dart:async';

import 'package:fillsa_flutter/domain/model/local_quote_info.dart';
import 'package:fillsa_flutter/domain/model/request/like_request.dart';
import 'package:fillsa_flutter/domain/model/response/DailyQuoteDto.dart';
import 'package:fillsa_flutter/domain/model/yn.dart';
import 'package:fillsa_flutter/domain/usecase/add_local_quote_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/find_local_quote_by_id_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/get_daily_quote_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/get_login_status_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/post_like_request_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/update_local_quote_like_usecase.dart';
import 'package:fillsa_flutter/presentation/state/HomeState.dart';
import 'package:fillsa_flutter/presentation/util/DateCondition.dart';
import 'package:fillsa_flutter/presentation/viewmodels/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/model/request/post_like_params.dart';
import '../../domain/model/response/DailyQuotaNoToken.dart';
import '../../domain/usecase/get_daily_quote_non_member_usecase.dart';
import '../util/LocaleOption.dart';

@injectable
class HomeViewModel extends AsyncNotifier<HomeState> with BaseViewModel {
  final GetDailyNonMemberUseCase _getDailyNonMemberUseCase;
  final GetLoginStatusUseCase _getLoginStatusUseCase;
  final PostLikeUseCase _postLikeUseCase;
  final FindLocalQuoteByIdUseCase _findLocalQuoteByIdUseCase;
  final UpdateLocalQuoteLikeUseCase _updateLocalQuoteLikeUseCase;
  final AddLocalQuoteUseCase _addLocalQuoteUseCase;
  final GetDailyQuoteUseCase _getDailyQuoteUseCase;
  // final GetLocalQuotesUseCase _getLocalQuotesUseCase;

  late final StreamSubscription<bool?> _loginStatusSubscription;

  final DateFormat _dateRequestFormat = DateFormat("yyyy-MM-dd");

  HomeViewModel(
    this._getDailyNonMemberUseCase,
    this._getLoginStatusUseCase,
    this._postLikeUseCase,
    this._findLocalQuoteByIdUseCase,
    this._updateLocalQuoteLikeUseCase,
    this._addLocalQuoteUseCase,
    this._getDailyQuoteUseCase,
    this._loginStatusSubscription,
    // this._getLocalQuotesUseCase,
  ) {}

  @override
  FutureOr<HomeState> build() async {
    ref.onDispose(() {
      _loginStatusSubscription.cancel();
    });

    getData().then((data) {
      if (data == null) {
        return;
      }

      state = AsyncValue.data(
        (state.hasValue ? state.requireValue : HomeState.initial()).copyWith(
          data: data,
        ),
      );
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

  // TODO: 아무리 생각해도 state와 연동을 하려면 APiResult는 쓸모없는 것 같다.
  Future<DailyQuoteDto?> getData() async {
    final targetDate = state.hasValue
        ? state.requireValue.targetDate
        : DateTime.now();

    final requestDate = targetDate != null
        ? _dateRequestFormat.format(targetDate)
        : _dateRequestFormat.format(DateTime.now());

    if (state.requireValue.isLogged) {
      final data = await getResponse(
        () => _getDailyQuoteUseCase.call(requestDate),
      );

      return data;
    } else {
      // final localData = await _getLocalQuotesUseCase();

      final data = await getResponse(
        () => _getDailyNonMemberUseCase.call(requestDate),
      );

      if (data == null) {
        return null;
      }

      // LocalQuoteInfo? localSavedData;
      //
      // try {
      //   localSavedData = localData.firstWhere(
      //     (target) => target.dailyQuoteSeq == data.dailyQuoteSeq,
      //   );
      // } catch (e) {
      //   localSavedData = null;
      // }

      final DailyQuotaNoToken noTokenDto = data;

      final uiQuote = DailyQuoteDto(
        likeYn: "N",
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
  }

  void postLike(bool isLiked) async {
    final isLogged = state.requireValue.isLogged;
    state = AsyncValue.data(state.requireValue.copyWith(isLiked: isLiked));
    if (isLogged) {
      final quote = state.requireValue.data;
      final String like = isLiked ? YN.Y.name : YN.N.name;

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

          if (data == null) {
            // TODO: 에러 하나 만들기
            throw Exception("Data is Null");
          }

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

          if (data == null) {
            // TODO: 에러 하나 만들기
            throw Exception("Data is Null");
          }

          return state.requireValue.copyWith(data: data);
        });
      }
    }
  }

  void updateLocale(LocaleOption selected) {
    state = AsyncValue.data(
      state.requireValue.copyWith(currentLocale: selected),
    );
  }

  void _postLocalLike() async {
    final quote = state.requireValue.data;
    final localQuote = await _findLocalQuoteByIdUseCase.call(
      quote.dailyQuoteSeq,
    );
    if (localQuote != null) {
      _updateLocalQuoteLikeUseCase.call((
        likeYN: (localQuote.likeYn == YN.Y.name ? YN.Y : YN.N),
        seq: localQuote.dailyQuoteSeq,
      ));
    } else {
      final now = state.requireValue.targetDate ?? DateTime.now();
      _addLocalQuoteUseCase.call(
        LocalQuoteInfo(
          dailyQuoteSeq: quote.dailyQuoteSeq,
          korQuote: quote.korQuote ?? "",
          engQuote: quote.engQuote ?? "",
          korAuthor: quote.korAuthor ?? "",
          engAuthor: quote.engAuthor ?? "",
          korTyping: "",
          engTyping: "",
          likeYn: YN.Y.name,
          memo: "",
          date: now,
          dayOfWeek: DateFormat('E', 'ko_KR').format(now),
        ),
      );
    }
  }
}
