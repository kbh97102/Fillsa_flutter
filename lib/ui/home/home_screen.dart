import 'package:fillsa_flutter/ui/common/interaction_button_section.dart';
import 'package:fillsa_flutter/ui/home/calendar_section.dart';
import 'package:fillsa_flutter/ui/home/custom_switch.dart';
import 'package:fillsa_flutter/ui/home/image_section.dart';
import 'package:fillsa_flutter/ui/home/quote_section.dart';
import 'package:fillsa_flutter/util/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: yellow03,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(child: CalendarSection()),
                    SizedBox(width: 20),
                    Expanded(child: ImageSection(isLogin: false)),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: KoreanEnglishSwitch(),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: QuoteSection(),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 28, bottom: 20),
                child: InteractionButtonSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
