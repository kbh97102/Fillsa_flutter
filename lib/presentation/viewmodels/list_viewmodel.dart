import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/model/api_result.dart';
import '../../domain/model/local_quote_info.dart';
import '../../domain/model/response/MemberQuotesResponse.dart';
import '../../domain/model/yn.dart';
import '../../domain/usecase/get_local_quotes_paging_usecase.dart';
import '../../domain/usecase/get_login_status_usecase.dart';
import '../../domain/usecase/get_quotes_list_usecase.dart';
import '../../domain/usecase/post_save_memo_usecase.dart';
import '../../domain/usecase/update_local_quote_like_usecase.dart';
import '../../domain/usecase/update_memo_usecase.dart';
import '../state/quote_list_state.dart';
import 'base_viewmodel.dart';

@injectable
class ListViewModel extends AsyncNotifier<QuoteListState> with BaseViewModel {
  final GetLoginStatusUseCase _getLoginStatusUseCase;
  final GetQuotesListUseCase _getQuotesListUseCase;
  final GetLocalQuotesPagingUseCase _getLocalQuotesPagingUseCase;
  final UpdateLocalQuoteLikeUseCase _updateLocalQuoteLikeUseCase;
  final UpdateLocalQuoteMemoUseCase _updateLocalQuoteMemoUseCase;
  final PostSaveMemoUseCase _postSaveMemoUseCase;

  StreamSubscription<bool?>? _loginStatusSubscription;

  static const int _pageSize = 30;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  ListViewModel(
    this._getLoginStatusUseCase,
    this._getQuotesListUseCase,
    this._getLocalQuotesPagingUseCase,
    this._updateLocalQuoteLikeUseCase,
    this._updateLocalQuoteMemoUseCase,
    this._postSaveMemoUseCase,
  );

  @override
  FutureOr<QuoteListState> build() async {
    _loginStatusSubscription?.cancel();
    _loginStatusSubscription = null;

    ref.onDispose(() {
      _loginStatusSubscription?.cancel();
      onDispose();
    });

    bool isLogged = false;
    try {
      isLogged = await _getLoginStatusUseCase().first == true;
    } catch (_) {}

    final initial = QuoteListState.initial().copyWith(isLogged: isLogged);
    final quotes = await _fetchQuotes(initial, reset: true);

    _loginStatusSubscription = _getLoginStatusUseCase().skip(1).listen((status) {
      if (!state.hasValue) return;
      final logged = status == true;
      final current = state.requireValue;
      if (current.isLogged == logged) return;
      state = AsyncValue.data(
        current.copyWith(
          isLogged: logged,
          memberQuotes: [],
          localQuotes: [],
          currentPage: 0,
          hasMore: true,
        ),
      );
      _reload();
    });

    return quotes;
  }

  Future<void> loadMore() async {
    if (!state.hasValue) return;
    final current = state.requireValue;
    if (current.isLoading || !current.hasMore) return;

    state = AsyncValue.data(current.copyWith(isLoading: true));
    final updated = await _fetchQuotes(state.requireValue);
    if (state.hasValue) {
      state = AsyncValue.data(updated.copyWith(isLoading: false));
    }
  }

  Future<void> setLikeFilter(bool liked) async {
    if (!state.hasValue) return;
    final current = state.requireValue.copyWith(
      likeFilter: liked,
      memberQuotes: [],
      localQuotes: [],
      currentPage: 0,
      hasMore: true,
    );
    state = AsyncValue.data(current);
    _reload();
  }

  Future<void> setDateRange(DateTime start, DateTime end) async {
    if (!state.hasValue) return;
    final current = state.requireValue.copyWith(
      startDate: start,
      endDate: end,
      memberQuotes: [],
      localQuotes: [],
      currentPage: 0,
      hasMore: true,
      showCalendar: false,
    );
    state = AsyncValue.data(current);
    _reload();
  }

  void toggleCalendar() {
    if (!state.hasValue) return;
    state = AsyncValue.data(
      state.requireValue.copyWith(
        showCalendar: !state.requireValue.showCalendar,
      ),
    );
  }

  Future<void> updateLike({
    required bool isLiked,
    MemberQuotesResponse? memberQuote,
    LocalQuoteInfo? localQuote,
  }) async {
    if (!state.hasValue) return;
    final current = state.requireValue;

    if (current.isLogged && memberQuote != null) {
      // 낙관적 업데이트
      final updated = current.memberQuotes.map((q) {
        if (q.memberQuoteSeq == memberQuote.memberQuoteSeq) {
          return MemberQuotesResponse(
            memberQuoteSeq: q.memberQuoteSeq,
            quoteDate: q.quoteDate,
            quoteDayOfWeek: q.quoteDayOfWeek,
            korQuote: q.korQuote,
            engQuote: q.engQuote,
            korAuthor: q.korAuthor,
            engAuthor: q.engAuthor,
            authorUrl: q.authorUrl,
            memo: q.memo,
            memoYnString: q.memoYnString,
            likeYnString: isLiked ? YN.Y.name : YN.N.name,
            imagePath: q.imagePath,
          );
        }
        return q;
      }).toList();
      state = AsyncValue.data(current.copyWith(memberQuotes: updated));
    } else if (!current.isLogged && localQuote != null) {
      _updateLocalQuoteLikeUseCase.call((
        likeYN: isLiked ? YN.Y : YN.N,
        seq: localQuote.dailyQuoteSeq,
      ));
      // 좋아요 해제 + 필사 기록 없음 → DB에서도 삭제되므로 목록에서 제거
      final shouldRemove = !isLiked &&
          localQuote.korTyping.isEmpty &&
          localQuote.engTyping.isEmpty;
      // likeFilter ON 상태에서 좋아요 해제 시에도 목록에서 제거
      if (shouldRemove || (current.likeFilter && !isLiked)) {
        final removed = current.localQuotes
            .where((q) => q.dailyQuoteSeq != localQuote.dailyQuoteSeq)
            .toList();
        state = AsyncValue.data(current.copyWith(localQuotes: removed));
        return;
      }
      final updated = current.localQuotes.map((q) {
        if (q.dailyQuoteSeq == localQuote.dailyQuoteSeq) {
          return LocalQuoteInfo(
            dailyQuoteSeq: q.dailyQuoteSeq,
            korQuote: q.korQuote,
            engQuote: q.engQuote,
            korAuthor: q.korAuthor,
            engAuthor: q.engAuthor,
            korTyping: q.korTyping,
            engTyping: q.engTyping,
            likeYn: isLiked ? YN.Y.name : YN.N.name,
            memo: q.memo,
            date: q.date,
            dayOfWeek: q.dayOfWeek,
          );
        }
        return q;
      }).toList();
      state = AsyncValue.data(current.copyWith(localQuotes: updated));
    }
  }

  Future<void> saveMemo({
    required String memo,
    MemberQuotesResponse? memberQuote,
    LocalQuoteInfo? localQuote,
  }) async {
    if (!state.hasValue) return;
    final current = state.requireValue;

    if (current.isLogged && memberQuote != null) {
      await _postSaveMemoUseCase.call((
        memberQuoteSeq: memberQuote.memberQuoteSeq.toString(),
        memo: memo,
      ));
      final updated = current.memberQuotes.map((q) {
        if (q.memberQuoteSeq == memberQuote.memberQuoteSeq) {
          return MemberQuotesResponse(
            memberQuoteSeq: q.memberQuoteSeq,
            quoteDate: q.quoteDate,
            quoteDayOfWeek: q.quoteDayOfWeek,
            korQuote: q.korQuote,
            engQuote: q.engQuote,
            korAuthor: q.korAuthor,
            engAuthor: q.engAuthor,
            authorUrl: q.authorUrl,
            memo: memo,
            memoYnString: memo.isNotEmpty ? YN.Y.name : YN.N.name,
            likeYnString: q.likeYnString,
            imagePath: q.imagePath,
          );
        }
        return q;
      }).toList();
      state = AsyncValue.data(current.copyWith(memberQuotes: updated));
    } else if (!current.isLogged && localQuote != null) {
      await _updateLocalQuoteMemoUseCase.call((
        memo: memo,
        seq: localQuote.dailyQuoteSeq,
      ));
      final updated = current.localQuotes.map((q) {
        if (q.dailyQuoteSeq == localQuote.dailyQuoteSeq) {
          return LocalQuoteInfo(
            dailyQuoteSeq: q.dailyQuoteSeq,
            korQuote: q.korQuote,
            engQuote: q.engQuote,
            korAuthor: q.korAuthor,
            engAuthor: q.engAuthor,
            korTyping: q.korTyping,
            engTyping: q.engTyping,
            likeYn: q.likeYn,
            memo: memo,
            date: q.date,
            dayOfWeek: q.dayOfWeek,
          );
        }
        return q;
      }).toList();
      state = AsyncValue.data(current.copyWith(localQuotes: updated));
    }
  }

  void _reload() async {
    if (!state.hasValue) return;
    final updated = await _fetchQuotes(state.requireValue, reset: true);
    if (state.hasValue) state = AsyncValue.data(updated);
  }

  Future<QuoteListState> _fetchQuotes(
    QuoteListState current, {
    bool reset = false,
  }) async {
    final startDate = _dateFormat.format(current.startDate);
    final endDate = _dateFormat.format(current.endDate);
    final likeYN = current.likeFilter ? YN.Y : YN.N;
    final page = reset ? 0 : current.currentPage;

    if (current.isLogged) {
      final result = await _getQuotesListUseCase.call((
        likeYN: likeYN,
        startDate: startDate,
        endDate: endDate,
        page: page,
        size: _pageSize,
      ));
      return switch (result) {
        Success(data: final data) => current.copyWith(
          memberQuotes: reset
              ? data.content
              : [...current.memberQuotes, ...data.content],
          currentPage: page + 1,
          hasMore: (page + 1) < data.totalPages,
        ),
        Fail() => current.copyWith(hasMore: false),
      };
    } else {
      final items = await _getLocalQuotesPagingUseCase.call((
        likeYN: likeYN ?? YN.N,
        startDate: startDate,
        endDate: endDate,
        page: page,
        size: _pageSize,
      ));
      return current.copyWith(
        localQuotes: reset ? items : [...current.localQuotes, ...items],
        currentPage: page + 1,
        hasMore: items.length == _pageSize,
      );
    }
  }
}
