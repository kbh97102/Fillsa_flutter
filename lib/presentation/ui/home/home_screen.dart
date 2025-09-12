import 'package:fillsa_flutter/presentation/ui/common/common_dialog.dart';
import 'package:fillsa_flutter/presentation/ui/common/image_change_dialog.dart';
import 'package:fillsa_flutter/presentation/ui/home/home_provider.dart';
import 'package:fillsa_flutter/presentation/ui/home/quote_section.dart';
import 'package:fillsa_flutter/presentation/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../util/LocaleOption.dart';
import '../../util/colors.dart';
import '../common/interaction_button_section.dart';
import '../common/my_deferred_pointer.dart';
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
        final String _selectedQuote = switch (state.currentLocale) {
          LocaleOption.KR => state.data.korQuote ?? "",
          LocaleOption.EN => state.data.engQuote ?? "",
        };

        final String _selectedAuthor = switch (state.currentLocale) {
          LocaleOption.KR => state.data.korAuthor ?? "",
          LocaleOption.EN => state.data.engAuthor ?? "",
        };

        return Container(
          color: yellow03,
          child: SafeArea(
            child: MyDeferredPointerHandler(
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
                                imageOnClick(
                                  context: context,
                                  quote: state.data.korQuote ?? "",
                                  author: state.data.korAuthor ?? "",
                                  isLogged: state.isLogged,
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
                        child: KoreanEnglishSwitch(
                          selected: state.currentLocale,
                          onClick: (selected) {
                            ref
                                .read(homeViewModelProvider.notifier)
                                .updateLocale(selected);
                          },
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: QuoteSection(
                        quote: _selectedQuote,
                        author: _selectedAuthor,
                        beforeOnClick: () {
                          ref
                              .read(homeViewModelProvider.notifier)
                              .beforeOnClick();
                        },
                        afterOnClick: () {
                          ref
                              .read(homeViewModelProvider.notifier)
                              .afterOnClick();
                        },
                        today: state.targetDate ?? DateTime.now(),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 28, bottom: 20),
                      child: InteractionButtonSection(
                        isLiked: state.isLiked,
                        setIsLiked: (liked) {
                          ref
                              .read(homeViewModelProvider.notifier)
                              .postLike(liked);
                        },
                      ),
                    ),
                  ],
                ),
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

  void imageOnClick({
    required BuildContext context,
    required String quote,
    required String author,
    required bool isLogged,
  }) {
    if (isLogged) {
      showDialog(
        context: context,
        builder: (context) =>
            getImageDialog(context: context, quote: quote, author: author),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => CommonDialog(
          title: "로그인 후 사용하실 수 있습니다.",
          okButtonText: "로그인 하기",
          okButtonOnClick: () {
            Navigator.pop(context);
            LoginRoute()..push(context);
          },
          cancelButtonOnClick: () {
            Navigator.pop(context);
          },
        ),
      );
    }
  }
}
