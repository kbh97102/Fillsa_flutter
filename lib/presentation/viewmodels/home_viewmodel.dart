import 'dart:async';
import 'dart:io';

import 'package:fillsa_flutter/domain/model/local_quote_info.dart';
import 'package:fillsa_flutter/domain/model/request/like_request.dart';
import 'package:fillsa_flutter/domain/model/request/post_upload_image_params.dart';
import 'package:fillsa_flutter/domain/model/response/DailyQuoteDto.dart';
import 'package:fillsa_flutter/domain/model/yn.dart';
import 'package:fillsa_flutter/domain/usecase/add_local_quote_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/delete_upload_image_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/find_local_quote_by_id_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/get_daily_quote_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/get_login_status_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/post_like_request_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/post_upload_image_usecase.dart';
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
import '../../domain/usecase/get_local_quotes_usecase.dart';
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
  final GetLocalQuotesUseCase _getLocalQuotesUseCase;
  final PostUploadImageUseCase _postUploadImageUseCase;
  final DeleteUploadImageUseCase _deleteUploadImageUseCase;

  StreamSubscription<bool?>? _loginStatusSubscription;
  bool _disposed = false;

  final DateFormat _dateRequestFormat = DateFormat("yyyy-MM-dd");

  HomeViewModel(
    this._getDailyNonMemberUseCase,
    this._getLoginStatusUseCase,
    this._postLikeUseCase,
    this._findLocalQuoteByIdUseCase,
    this._updateLocalQuoteLikeUseCase,
    this._addLocalQuoteUseCase,
    this._getDailyQuoteUseCase,
    this._getLocalQuotesUseCase,
    this._postUploadImageUseCase,
    this._deleteUploadImageUseCase,
  );

  @override
  FutureOr<HomeState> build() async {
    _disposed = false;
    ref.onDispose(() {
      _disposed = true;
      _loginStatusSubscription?.cancel();
    });

    // 1. 로그인 상태를 먼저 확정한 뒤 getData() 호출
    //    LocalRepository가 BehaviorSubject를 사용하므로 .first는 즉시 반환됨
    bool initialIsLogged = false;
    try {
      initialIsLogged = await _getLoginStatusUseCase().first == true;
    } catch (_) {}

    // 2. 확정된 로그인 상태를 넘겨 올바른 API(회원/비회원) 호출
    final data = await getData(isLoggedOverride: initialIsLogged);

    if (_disposed) return HomeState.initial();

    // 3. 로그인 상태가 이후 변경될 때: 상태 갱신 + 데이터 재조회
    //    skip(1) — 첫 번째 방출(이미 처리한 initialIsLogged)은 무시
    _loginStatusSubscription = _getLoginStatusUseCase().skip(1).listen((status) {
      if (_disposed || !state.hasValue) return;
      final isLogged = status == true;
      state = AsyncValue.data(state.requireValue.copyWith(isLogged: isLogged));
      _refreshData();
    });

    return HomeState.initial().copyWith(
      isLogged: initialIsLogged,
      data: data ?? DailyQuoteDto.empty,
      isLiked: data?.likeYn == YN.Y.name,
    );
  }

  // 로그인 상태 변경 후 현재 날짜 기준으로 데이터 재조회
  void _refreshData() async {
    if (_disposed || !state.hasValue) return;
    final data = await getData();
    if (!_disposed && data != null && state.hasValue) {
      state = AsyncValue.data(
        state.requireValue.copyWith(
          data: data,
          isLiked: data.likeYn == YN.Y.name,
        ),
      );
    }
  }

  /// [isLoggedOverride] — build() 초기화 시 state가 확정되기 전에 호출할 경우 직접 전달
  Future<DailyQuoteDto?> getData({bool? isLoggedOverride}) async {
    final targetDate =
        state.hasValue ? state.requireValue.targetDate : DateTime.now();

    final requestDate = targetDate != null
        ? _dateRequestFormat.format(targetDate)
        : _dateRequestFormat.format(DateTime.now());

    final isLogged =
        isLoggedOverride ?? (state.hasValue && state.requireValue.isLogged);

    if (isLogged) {
      return getResponse(() => _getDailyQuoteUseCase.call(requestDate));
    } else {
      final localData = await _getLocalQuotesUseCase();
      final data = await getResponse(
        () => _getDailyNonMemberUseCase.call(requestDate),
      );

      if (data == null) return null;

      final DailyQuotaNoToken noTokenDto = data;
      LocalQuoteInfo? localSavedData;
      try {
        localSavedData = localData.firstWhere(
          (t) => t.dailyQuoteSeq == data.dailyQuoteSeq,
        );
      } catch (_) {
        localSavedData = null;
      }

      return DailyQuoteDto(
        likeYn: localSavedData?.likeYn ?? YN.N.name,
        imagePath: "",
        dailyQuoteSeq: noTokenDto.dailyQuoteSeq,
        korQuote: noTokenDto.korQuote,
        engQuote: noTokenDto.engQuote,
        korAuthor: noTokenDto.korAuthor,
        engAuthor: noTokenDto.engAuthor,
        authorUrl: noTokenDto.authorUrl,
      );
    }
  }

  void postLike(bool isLiked) async {
    if (!state.hasValue) return;
    final isLogged = state.requireValue.isLogged;
    state = AsyncValue.data(state.requireValue.copyWith(isLiked: isLiked));
    if (isLogged) {
      final quote = state.requireValue.data;
      _postLikeUseCase.call(
        PostLikeParams(
          dailyQuoteSeq: quote.dailyQuoteSeq,
          likeRequest: LikeRequest(likeYn: isLiked ? YN.Y.name : YN.N.name),
        ),
      );
    } else {
      _postLocalLike(isLiked);
    }
  }

  Future<void> beforeOnClick() async {
    if (!state.hasValue) return;
    final targetDate = state.requireValue.targetDate;
    if (targetDate == null) return;

    final target = DateUtils.addDaysToDate(targetDate, -1);
    if (target.isBefore(DateCondition.startDay)) return;

    state = AsyncValue.data(state.requireValue.copyWith(targetDate: target));
    state = await AsyncValue.guard(() async {
      final data = await getData();
      if (data == null) throw Exception("Data is Null");
      return state.requireValue.copyWith(
        data: data,
        isLiked: data.likeYn == YN.Y.name,
      );
    });
  }

  Future<void> afterOnClick() async {
    if (!state.hasValue) return;
    final targetDate = state.requireValue.targetDate;
    if (targetDate == null) return;

    final target = DateUtils.addDaysToDate(targetDate, 1);
    if (target.isAfter(DateTime.now())) return;

    state = AsyncValue.data(state.requireValue.copyWith(targetDate: target));
    state = await AsyncValue.guard(() async {
      final data = await getData();
      if (data == null) throw Exception("Data is Null");
      return state.requireValue.copyWith(
        data: data,
        isLiked: data.likeYn == YN.Y.name,
      );
    });
  }

  void updateLocale(LocaleOption selected) {
    if (!state.hasValue) return;
    state = AsyncValue.data(state.requireValue.copyWith(currentLocale: selected));
  }

  Future<void> uploadImage(File file) async {
    if (!state.hasValue) return;
    final seq = state.requireValue.data.dailyQuoteSeq;
    try {
      await _postUploadImageUseCase.call(
        PostUploadImageParams(dailyQuoteSeq: seq, imageFile: file),
      );
      // 업로드 후 회원 API 재조회하여 최신 imagePath 반영
      final refreshed = await getData();
      if (refreshed != null && state.hasValue) {
        state = AsyncValue.data(state.requireValue.copyWith(data: refreshed));
      }
    } catch (e) {
      emitError(e.toString());
    }
  }

  Future<void> deleteImage() async {
    if (!state.hasValue) return;
    final seq = state.requireValue.data.dailyQuoteSeq;
    try {
      await _deleteUploadImageUseCase.call(seq);
      if (state.hasValue) {
        final updated = state.requireValue.data.copyWith(imagePath: null);
        state = AsyncValue.data(state.requireValue.copyWith(data: updated));
      }
    } catch (e) {
      emitError(e.toString());
    }
  }

  void _postLocalLike(bool isLiked) async {
    if (!state.hasValue) return;
    final quote = state.requireValue.data;
    final localQuote = await _findLocalQuoteByIdUseCase.call(quote.dailyQuoteSeq);
    if (localQuote != null) {
      _updateLocalQuoteLikeUseCase.call((
        likeYN: (isLiked ? YN.Y : YN.N),
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
