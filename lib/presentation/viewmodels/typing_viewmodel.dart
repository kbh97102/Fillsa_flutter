import 'dart:async';

import 'package:fillsa_flutter/domain/model/local_quote_info.dart';
import 'package:fillsa_flutter/domain/model/request/typing_quote_request.dart';
import 'package:fillsa_flutter/domain/model/response/DailyQuoteDto.dart';
import 'package:fillsa_flutter/domain/model/yn.dart';
import 'package:fillsa_flutter/domain/usecase/add_local_quote_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/find_local_quote_by_id_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/get_login_status_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/get_typing_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/post_typing_usecase.dart';
import 'package:fillsa_flutter/presentation/state/TypingState.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';

@injectable
class TypingViewModel extends Notifier<TypingState> {
  final GetLoginStatusUseCase _getLoginStatusUseCase;
  final PostTypingUseCase _postTypingUseCase;
  final AddLocalQuoteUseCase _addLocalQuoteUseCase;
  final GetTypingUseCase _getTypingUseCase;
  final FindLocalQuoteByIdUseCase _findLocalQuoteByIdUseCase;

  TypingViewModel(
    this._getLoginStatusUseCase,
    this._postTypingUseCase,
    this._addLocalQuoteUseCase,
    this._getTypingUseCase,
    this._findLocalQuoteByIdUseCase,
  );

  @override
  TypingState build() => const TypingState();

  Future<void> load(int dailyQuoteSeq) async {
    state = state.copyWith(isLoading: true);
    try {
      final isLoggedIn = await _getLoginStatusUseCase().first == true;
      if (isLoggedIn) {
        final response = await _getTypingUseCase.call(dailyQuoteSeq);
        state = state.copyWith(
          isLoading: false,
          savedKorTyping: response.typingKorQuote ?? '',
          savedEngTyping: response.typingEngQuote ?? '',
          isLiked: response.likeYn == YN.Y.name,
        );
      } else {
        final local = await _findLocalQuoteByIdUseCase.call(dailyQuoteSeq);
        state = state.copyWith(
          isLoading: false,
          savedKorTyping: local?.korTyping ?? '',
          savedEngTyping: local?.engTyping ?? '',
          isLiked: local?.likeYn == YN.Y.name,
        );
      }
    } catch (e, st) {
      debugPrint('[TypingViewModel] load 실패: $e\n$st');
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> save({
    required DailyQuoteDto dailyQuote,
    required String korTyping,
    required String engTyping,
    required bool isLiked,
  }) async {
    if (state.isSaving) return;
    state = state.copyWith(isSaving: true);

    try {
      final isLoggedIn = await _getLoginStatusUseCase().first == true;

      if (isLoggedIn) {
        await _postTypingUseCase.call((
          dailyQuoteSeq: dailyQuote.dailyQuoteSeq,
          request: TypingQuoteRequest(
            typingKorQuote: korTyping,
            typingEngQuote: engTyping,
          ),
        ));
      } else {
        final now = DateTime.now();
        await _addLocalQuoteUseCase.call(
          LocalQuoteInfo(
            dailyQuoteSeq: dailyQuote.dailyQuoteSeq,
            korQuote: dailyQuote.korQuote ?? '',
            engQuote: dailyQuote.engQuote ?? '',
            korAuthor: dailyQuote.korAuthor ?? '',
            engAuthor: dailyQuote.engAuthor ?? '',
            korTyping: korTyping,
            engTyping: engTyping,
            likeYn: isLiked ? YN.Y.name : YN.N.name,
            memo: '',
            date: now,
            dayOfWeek: DateFormat('E', 'ko_KR').format(now),
          ),
        );
      }

      state = state.copyWith(
        isSaving: false,
        saveCount: state.saveCount + 1,
        clearError: true,
      );
    } catch (e, st) {
      debugPrint('[TypingViewModel] save 실패: $e\n$st');
      state = state.copyWith(isSaving: false, errorMessage: e.toString());
    }
  }
}
