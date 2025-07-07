import 'package:fillsa_flutter/ui/calendar/custom_calendar.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Material(child: CustomCalendar())]);
  }
}
