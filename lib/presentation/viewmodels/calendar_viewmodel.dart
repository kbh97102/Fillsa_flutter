import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/model/response/MemberQuotesData.dart';
import '../../domain/usecase/get_login_status_usecase.dart';
import '../../domain/usecase/get_monthly_quotes_non_member_usecase.dart';
import '../../domain/usecase/get_monthly_quotes_usecase.dart';
import '../state/calendar_state.dart';
import 'base_viewmodel.dart';

@injectable
class CalendarViewModel extends AsyncNotifier<CalendarState> with BaseViewModel {
  final GetMonthlyQuotesUseCase _getMonthlyQuotesUseCase;
  final GetMonthlyQuotesNonMemberUseCase _getMonthlyQuotesNonMemberUseCase;
  final GetLoginStatusUseCase _getLoginStatusUseCase;

  late final StreamSubscription<bool?> _loginStatusSubscription;

  final DateFormat _monthFormat = DateFormat('yyyy-MM');
  final DateFormat _dayFormat = DateFormat('yyyy-MM-dd');

  CalendarViewModel(
    this._getMonthlyQuotesUseCase,
    this._getMonthlyQuotesNonMemberUseCase,
    this._getLoginStatusUseCase,
  );

  @override
  FutureOr<CalendarState> build() async {
    ref.onDispose(() {
      _loginStatusSubscription.cancel();
      onDispose();
    });

    bool isLogged = false;
    try {
      isLogged = await _getLoginStatusUseCase().first == true;
    } catch (_) {}

    final today = DateTime.now();
    final monthlyData = await _fetchMonthlyData(today, isLogged);
    final quote = _findQuote(monthlyData?.memberQuotes ?? [], today);

    _loginStatusSubscription = _getLoginStatusUseCase().skip(1).listen((status) {
      if (!state.hasValue) return;
      final logged = status == true;
      final current = state.requireValue;
      state = AsyncValue.data(current.copyWith(isLogged: logged));
      _refresh();
    });

    return CalendarState.initial().copyWith(
      isLogged: isLogged,
      monthlyData: monthlyData,
      selectedDay: today,
      selectedDayQuote: quote,
    );
  }

  Future<void> changeMonth(DateTime yearMonth) async {
    if (!state.hasValue) return;
    final firstDay = DateTime(yearMonth.year, yearMonth.month, 1);
    final isLogged = state.requireValue.isLogged;

    state = AsyncValue.data(
      state.requireValue.copyWith(selectedDay: firstDay, selectedDayQuote: ''),
    );

    final monthlyData = await _fetchMonthlyData(firstDay, isLogged);
    if (!state.hasValue) return;

    final quote = _findQuote(monthlyData?.memberQuotes ?? [], firstDay);
    state = AsyncValue.data(
      state.requireValue.copyWith(
        monthlyData: monthlyData,
        selectedDayQuote: quote,
      ),
    );
  }

  String currentYearMonth() {
    final day = state.hasValue ? state.requireValue.selectedDay : DateTime.now();
    return _monthFormat.format(day);
  }

  void selectDay(DateTime day) {
    if (!state.hasValue) return;
    final quotes = state.requireValue.monthlyData?.memberQuotes ?? [];
    final quote = _findQuote(quotes, day);
    state = AsyncValue.data(
      state.requireValue.copyWith(selectedDay: day, selectedDayQuote: quote),
    );
  }

  void _refresh() async {
    if (!state.hasValue) return;
    final selectedDay = state.requireValue.selectedDay;
    final isLogged = state.requireValue.isLogged;
    final monthlyData = await _fetchMonthlyData(selectedDay, isLogged);
    if (!state.hasValue) return;
    final quote = _findQuote(monthlyData?.memberQuotes ?? [], selectedDay);
    state = AsyncValue.data(
      state.requireValue.copyWith(
        monthlyData: monthlyData,
        selectedDayQuote: quote,
      ),
    );
  }

  Future<dynamic> _fetchMonthlyData(DateTime date, bool isLogged) async {
    final yearMonth = _monthFormat.format(date);
    if (isLogged) {
      return getResponse(() => _getMonthlyQuotesUseCase.call(yearMonth));
    } else {
      return getResponse(() => _getMonthlyQuotesNonMemberUseCase.call(yearMonth));
    }
  }

  String _findQuote(List<MemberQuotesData> quotes, DateTime day) {
    final key = _dayFormat.format(day);
    try {
      return quotes.firstWhere((q) => q.quoteDate == key).quote;
    } catch (_) {
      return '';
    }
  }
}
