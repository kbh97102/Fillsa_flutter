import 'package:fillsa_flutter/ui/home/calendar_section.dart';
import 'package:fillsa_flutter/ui/home/custom_switch.dart';
import 'package:fillsa_flutter/ui/home/image_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: CalendarSection()),
              SizedBox(width: 20),
              Expanded(child: ImageSection(isLogin: false)),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: KoreanEnglishSwitch(),
            ),
          ),
        ],
      ),
    );
  }
}
