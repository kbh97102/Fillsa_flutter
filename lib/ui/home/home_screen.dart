import 'package:fillsa_flutter/ui/home/calendar_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: CalendarSection()),
            Expanded(child: CalendarSection()),
          ],
        ),
      ],
    );
  }
}
