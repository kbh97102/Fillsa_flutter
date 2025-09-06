import 'package:flutter/material.dart';

import '../../ui/calendar/custom_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Material(child: CustomCalendar())]);
  }
}
