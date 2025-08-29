import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../util/colors.dart';

class CustomCalendar extends StatefulWidget {
  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  final DateTime _startDay = DateTime(2025, 3, 1);
  final DateTime _today = DateTime.now();
  late final DateTime _endDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = _startDay;
    _selectedDay = _startDay;
    _endDay = DateTime(_today.year, _today.month + 1, 0);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.6, // 전체 높이의 60%
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TableCalendar(
              locale: 'ko_KR',
              firstDay: _startDay,
              lastDay: _endDay,
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B6BFF),
                ),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Color(0xFF6B6BFF),
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Color(0xFF6B6BFF),
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.black87),
                weekdayStyle: TextStyle(color: Colors.black87),
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, _) =>
                    _buildDayCell(day, isSelected: false),
                selectedBuilder: (context, day, _) =>
                    _buildDayCell(day, isSelected: true),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDayCell(DateTime day, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        width: double.infinity,
        decoration: isSelected
            ? BoxDecoration(
                color: purple01,
                borderRadius: BorderRadius.circular(10),
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${day.day}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
              // TODO: 이후 조건에 따른 이모지 추가
              // emojis != null
              //     ? Padding(
              //       padding: const EdgeInsets.only(top: 2),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children:
              //             emojis
              //                 .map(
              //                   (e) => Text(
              //                     e,
              //                     style: const TextStyle(fontSize: 12),
              //                   ),
              //                 )
              //                 .toList(),
              //       ),
              //     )
              //     : Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
