import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../domain/model/response/MemberQuotesData.dart';
import '../../util/DateCondition.dart';
import '../../util/colors.dart';
import '../../util/extensions.dart';

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

    return Container(
      decoration: BoxDecoration(
        color: yellow01,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: yellow02),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TableCalendar(
        locale: 'ko_KR',
        firstDay: startDay,
        lastDay: DateTime(today.year, today.month, today.day),
        focusedDay: focusedDay,
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
          titleTextStyle: context.textStyles.buttonL.copyWith(color: purple01),
          leftChevronIcon: Icon(Icons.chevron_left, color: purple01),
          rightChevronIcon: Icon(Icons.chevron_right, color: purple01),
          leftChevronVisible: focusedDay.year > startDay.year ||
              focusedDay.month > startDay.month,
          rightChevronVisible: focusedDay.year < today.year ||
              focusedDay.month < today.month,
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: context.textStyles.buttonS.copyWith(color: grey500),
          weekendStyle: context.textStyles.buttonS.copyWith(color: grey500),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                color: purple01,
                borderRadius: BorderRadius.circular(10),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${day.day}',
              style: context.textStyles.body4.copyWith(
                color: isSelected
                    ? Colors.white
                    : isEnabled
                        ? grey700
                        : grey300,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  quoteData?.completed == true ? '📓' : '',
                  style: const TextStyle(fontSize: 9),
                ),
                Text(
                  quoteData?.isLiked == true ? '❤️' : '',
                  style: const TextStyle(fontSize: 9),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
