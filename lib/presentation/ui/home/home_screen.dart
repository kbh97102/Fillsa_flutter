import 'package:fillsa_flutter/presentation/ui/common/image_change_dialog.dart';
import 'package:fillsa_flutter/presentation/ui/home/home_provider.dart';
import 'package:fillsa_flutter/presentation/ui/home/quote_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final _state = _viewModel.state;

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
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // TODO: Login 여부 추가
                          showDialog(
                            context: context,
                            builder: (context) => ImageChangeDialog(
                              quote: _state.data.korQuote ?? "",
                              author: _state.data.korAuthor ?? "",
                              imageChangeOnClick: () {
                                // TODO: 갤러리 접근
                              },
                              okOnClick: () {
                                Navigator.pop(context);
                              },
                              deleteOnClick: () {
                                // TODO: 사진 제거 이벤트
                              },
                            ),
                          );
                        },
                        child: ImageSection(isLogin: false),
                      ),
                    ),
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
                child: QuoteSection(
                  quote: _viewModel.state.data.korQuote ?? "",
                  author: _viewModel.state.data.korAuthor ?? "",
                ),
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
