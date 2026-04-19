import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/fillsa_color_scheme.dart';
import '../../util/routes.dart';
import '../home/home_app_bar.dart';
import 'calendar_count_section.dart';
import 'calendar_provider.dart';
import 'calendar_quote_section.dart';
import 'calendar_section.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(calendarViewModelProvider);
    final viewModel = ref.read(calendarViewModelProvider.notifier);

    return asyncState.when(
      data: (state) {
        final summary = state.monthlyData?.monthlySummary;

        return Container(
          color: FillsaColorScheme.of(context).background,
          child: SafeArea(
            child: Column(
              children: [
                HomeAppBar(streakDays: summary?.streakCount ?? 0),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        CalendarSection(
                          memberQuotes: state.monthlyData?.memberQuotes ?? [],
                          selectedDay: state.selectedDay,
                          focusedDay: _focusedDay,
                          onDaySelected: (sel, foc) {
                            setState(() => _focusedDay = foc);
                            viewModel.selectDay(sel);
                          },
                          onPageChanged: (foc) {
                            setState(() => _focusedDay = foc);
                            viewModel.changeMonth(foc);
                          },
                        ),
                        const SizedBox(height: 12),
                        CalendarCountSection(
                          typingCount: summary?.typingCount ?? 0,
                          likeCount: summary?.likeCount ?? 0,
                          streakCount: summary?.streakCount ?? 0,
                          onTap: () {
                            ListRoute(
                              yearMonth: viewModel.currentYearMonth(),
                            ).go(context);
                          },
                        ),
                        const SizedBox(height: 12),
                        CalendarQuoteSection(
                          selectedDay: state.selectedDay,
                          quote: state.selectedDayQuote,
                          onTap: () {
                            final d = state.selectedDay;
                            HomeDateRoute(
                              date:
                                  '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}',
                            ).go(context);
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        body: Center(child: Text('오류가 발생했습니다: $e')),
      ),
    );
  }
}
