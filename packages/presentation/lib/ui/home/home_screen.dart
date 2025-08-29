import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/ui/home/quote_section.dart';
import 'package:presentation/viewmodels/home_viewmodel.dart';

import '../../util/colors.dart';
import '../common/interaction_button_section.dart';
import 'calendar_section.dart';
import 'custom_switch.dart';
import 'image_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(homeViewModelProvider);

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
