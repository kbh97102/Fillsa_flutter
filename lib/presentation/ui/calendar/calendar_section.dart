import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../domain/model/response/MemberQuotesData.dart';
import '../../theme/fillsa_color_scheme.dart';
import '../../util/DateCondition.dart';
import '../../util/colors.dart';
import '../../util/extensions.dart';
import '../guide/custom_svg.dart';

class CalendarSection extends StatelessWidget {
  final List<MemberQuotesData> memberQuotes;
  final DateTime selectedDay;
  final DateTime focusedDay;
  final void Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;
  final void Function(DateTime focusedDay) onPageChanged;

  const CalendarSection({
    super.key,
    required this.memberQuotes,
    required this.selectedDay,
    required this.focusedDay,
    required this.onDaySelected,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final startDay = DateCondition.startDay;
    final colorScheme = FillsaColorScheme.of(context);

    final canGoBack = focusedDay.year > startDay.year ||
        focusedDay.month > startDay.month;
    final canGoForward = focusedDay.year < today.year ||
        focusedDay.month < today.month;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.tertiary),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TableCalendar(
        locale: 'ko_KR',
        firstDay: startDay,
        lastDay: DateTime(today.year, today.month, today.day),
        focusedDay: focusedDay,
        rowHeight: 64,
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        enabledDayPredicate: (day) =>
            !day.isAfter(today) && !day.isBefore(startDay),
        onDaySelected: (sel, foc) {
          if (!sel.isAfter(today) && !sel.isBefore(startDay)) {
            onDaySelected(sel, foc);
          }
        },
        onPageChanged: onPageChanged,
        calendarFormat: CalendarFormat.month,
        availableGestures: AvailableGestures.horizontalSwipe,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: context.fillsaTypo.buttonLargeBold
              .copyWith(color: colorScheme.onBackground2),
          leftChevronVisible: true,
          rightChevronVisible: true,
          leftChevronIcon: AbsorbPointer(
            absorbing: !canGoBack,
            child: Opacity(
              opacity: canGoBack ? 1.0 : 0.3,
              child: Icon(Icons.chevron_left, color: colorScheme.onBackground2),
            ),
          ),
          rightChevronIcon: AbsorbPointer(
            absorbing: !canGoForward,
            child: Opacity(
              opacity: canGoForward ? 1.0 : 0.3,
              child: Icon(Icons.chevron_right, color: colorScheme.onBackground2),
            ),
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: context.fillsaTypo.buttonSmallBold
              .copyWith(color: colorScheme.onBackground1),
          weekendStyle: context.fillsaTypo.buttonSmallBold
              .copyWith(color: colorScheme.onBackground1),
        ),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (ctx, day, _) => _DayCell(
            day: day,
            quoteData: _findQuote(day),
            isSelected: false,
            isEnabled: true,
          ),
          selectedBuilder: (ctx, day, _) => _DayCell(
            day: day,
            quoteData: _findQuote(day),
            isSelected: true,
            isEnabled: true,
          ),
          disabledBuilder: (ctx, day, _) => _DayCell(
            day: day,
            quoteData: null,
            isSelected: false,
            isEnabled: false,
          ),
          outsideBuilder: (ctx, day, _) => _DayCell(
            day: day,
            quoteData: null,
            isSelected: false,
            isEnabled: false,
          ),
        ),
      ),
    );
  }

  MemberQuotesData? _findQuote(DateTime day) {
    final key = DateFormat('yyyy-MM-dd').format(day);
    try {
      return memberQuotes.firstWhere((q) => q.quoteDate == key);
    } catch (_) {
      return null;
    }
  }
}

class _DayCell extends StatelessWidget {
  final DateTime day;
  final MemberQuotesData? quoteData;
  final bool isSelected;
  final bool isEnabled;

  const _DayCell({
    required this.day,
    required this.quoteData,
    required this.isSelected,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = FillsaColorScheme.of(context);
    final hasCompleted = quoteData?.completed == true;
    final hasLiked = quoteData?.isLiked == true;
    final showIcons = isEnabled && (hasCompleted || hasLiked);

    final textColor = isSelected
        ? colorScheme.onPrimaryContainer
        : isEnabled
            ? colorScheme.onBackground1
            : grey400;

    // Android와 동일: padding(vertical=4) 안쪽에 background 적용
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        child: DecoratedBox(
          decoration: isSelected
              ? BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                )
              : const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${day.day}',
                textAlign: TextAlign.center,
                style: context.fillsaTypo.buttonSmallNormal
                    .copyWith(color: textColor),
              ),
              const SizedBox(height: 3),
              // 아이콘 영역: Android와 동일하게 padding(horizontal=5) + heightIn(min=12)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                        child: Row(
                          children: [
                            Opacity(
                              opacity: (showIcons && hasCompleted) ? 1.0 : 0.0,
                              child: const CustomSvg(
                                  svgName: 'icn_note_stack', width: 12, height: 12),
                            ),
                            const SizedBox(width: 2),
                            Opacity(
                              opacity: (showIcons && hasLiked) ? 1.0 : 0.0,
                              child: const CustomSvg(
                                  svgName: 'icn_heart_fill', width: 12, height: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                        child: Opacity(
                          opacity: (showIcons && hasCompleted) ? 1.0 : 0.0,
                          child: const CustomSvg(
                              svgName: 'icn_today_complete', width: 12, height: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
