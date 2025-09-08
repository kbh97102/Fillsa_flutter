import 'package:fillsa_flutter/presentation/ui/common/common_dialog.dart';
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

    return _viewModel.when(
      data: (state) {
        final notifier = ref.read(homeViewModelProvider.notifier);

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
                        Expanded(
                          child: CalendarSection(
                            date: state.targetDate ?? DateTime.now(),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // TODO: Login 여부 추가
                              showDialog(
                                context: context,
                                builder: (context) => getImageDialog(
                                  context: context,
                                  quote: state.data.korQuote ?? "",
                                  author: state.data.korAuthor ?? "",
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
                      quote: state.data.korQuote ?? "",
                      author: state.data.korAuthor ?? "",
                      beforeOnClick: () {
                        notifier.beforeOnClick();
                      },
                      afterOnClick: () {
                        notifier.afterOnClick();
                      },
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
      },
      error: (err, stack) {
        return Container();
      },
      loading: () => Container(),
    );
  }

  Widget getDeleteDialog(BuildContext context) {
    return CommonDialog(
      title: "이미지를 삭제하시겠습니까?",
      body: "삭제 후 이미지를 되돌릴 수 없습니다. 😢",
      cancelButtonText: "삭제하기",
      cancelButtonColor: purple01,
      cancelButtonBorderColor: purple01,
      cancelTextColor: Colors.white,
      okButtonText: "취소",
      okButtonColor: Colors.white,
      okTextColor: purple01,
      okButtonBorderColor: purple01,
      okButtonOnClick: () => {Navigator.pop(context)},
    );
  }

  Widget getImageDialog({
    required BuildContext context,
    required String quote,
    required String author,
  }) {
    return ImageChangeDialog(
      quote: quote,
      author: author,
      imageChangeOnClick: () {
        // TODO: 갤러리 접근
      },
      okOnClick: () {
        Navigator.pop(context);
      },
      deleteOnClick: () {
        // TODO: 사진 제거 이벤트
        showDialog(
          context: context,
          builder: (context) => getDeleteDialog(context),
        );
      },
    );
  }
}
