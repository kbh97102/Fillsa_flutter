import 'dart:io';

import 'package:fillsa_flutter/presentation/ui/common/common_dialog.dart';
import 'package:fillsa_flutter/presentation/ui/common/image_change_dialog.dart';
import 'package:fillsa_flutter/presentation/ui/home/home_app_bar.dart';
import 'package:fillsa_flutter/presentation/ui/home/home_provider.dart';
import 'package:fillsa_flutter/presentation/ui/home/quote_section.dart';
import 'package:fillsa_flutter/presentation/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/fillsa_color_scheme.dart';
import '../../util/LocaleOption.dart';
import '../common/interaction_button_section.dart';
import '../common/my_deferred_pointer.dart';
import 'calendar_section.dart';
import 'custom_switch.dart';
import 'image_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(homeViewModelProvider);
    final state = asyncState.value;
    final isLoading = !asyncState.hasValue;

    if (asyncState.hasError && !asyncState.hasValue) {
      return Container(color: FillsaColorScheme.of(context).background);
    }

    final selectedQuote = switch (state?.currentLocale ?? LocaleOption.KR) {
      LocaleOption.KR => state?.data.korQuote ?? "",
      LocaleOption.EN => state?.data.engQuote ?? "",
    };

    final selectedAuthor = switch (state?.currentLocale ?? LocaleOption.KR) {
      LocaleOption.KR => state?.data.korAuthor ?? "",
      LocaleOption.EN => state?.data.engAuthor ?? "",
    };

    final colorScheme = FillsaColorScheme.of(context);
    return Container(
      color: colorScheme.background,
      child: SafeArea(
        child: MyDeferredPointerHandler(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeAppBar(
                streakDays: state?.streakInfo?.currentStreak ?? 0,
              ),
              Padding(
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
                              date: state?.targetDate ?? DateTime.now(),
                              onTap: () => CalendarRoute().go(context),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: GestureDetector(
                              onTap: state == null
                                  ? null
                                  : () {
                                      _imageOnClick(
                                        context: context,
                                        ref: ref,
                                        quote: state.data.korQuote ?? "",
                                        author: state.data.korAuthor ?? "",
                                        isLogged: state.isLogged,
                                      );
                                    },
                              child: ImageSection(
                                isLogin: state?.isLogged ?? false,
                                imagePath: state?.data.imagePath,
                              ),
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
                          selected: state?.currentLocale ?? LocaleOption.KR,
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
                      child: isLoading
                          ? _QuoteSectionSkeleton(colorScheme: colorScheme)
                          : QuoteSection(
                              quote: selectedQuote,
                              author: selectedAuthor,
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
                              today: state?.targetDate ?? DateTime.now(),
                              onQuoteTap: state == null
                                  ? null
                                  : () => TypingRoute($extra: state.data)
                                      .push(context),
                              onAuthorTap: () => _openAuthorUrl(
                                context,
                                state?.data.authorUrl,
                              ),
                            ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 28, bottom: 20),
                      child: InteractionButtonSection(
                        isLiked: state?.isLiked ?? false,
                        onCopy: () => _copyQuote(
                          context,
                          selectedQuote,
                          selectedAuthor,
                        ),
                        onShare: () => ShareRoute().push(context),
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
            ],
          ),
        ),
      ),
    );
  }

  void _copyQuote(BuildContext context, String quote, String author) {
    Clipboard.setData(ClipboardData(text: "$quote - $author"));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("복사되었습니다.")),
    );
  }

  Future<void> _openAuthorUrl(BuildContext context, String? authorUrl) async {
    if (authorUrl == null || authorUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("저자 정보가 없습니다.")),
      );
      return;
    }
    final uri = Uri.tryParse(authorUrl);
    if (uri != null) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Widget _getDeleteDialog({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    return CommonDialog(
      title: "이미지를 삭제하시겠습니까?",
      body: "삭제 후 이미지를 되돌릴 수 없습니다. 😢",
      okButtonText: "삭제",
      cancelButtonText: "취소",
      okButtonOnClick: () async {
        if (!context.mounted) return;
        Navigator.pop(context);
        if (!context.mounted) return;
        Navigator.pop(context);
        await ref.read(homeViewModelProvider.notifier).deleteImage();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("이미지가 삭제되었습니다.")),
          );
        }
      },
      cancelButtonOnClick: () => Navigator.pop(context),
    );
  }

  Widget _getImageDialog({
    required BuildContext context,
    required WidgetRef ref,
    required String quote,
    required String author,
  }) {
    return ImageChangeDialog(
      quote: quote,
      author: author,
      imageChangeOnClick: () async {
        final picker = ImagePicker();
        final xFile = await picker.pickImage(source: ImageSource.gallery);
        if (xFile == null) return;
        if (!context.mounted) return;
        Navigator.pop(context);
        await ref
            .read(homeViewModelProvider.notifier)
            .uploadImage(File(xFile.path));
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("이미지가 변경되었습니다.")),
          );
        }
      },
      okOnClick: () => Navigator.pop(context),
      deleteOnClick: () {
        showDialog(
          context: context,
          builder: (ctx) => _getDeleteDialog(context: ctx, ref: ref),
        );
      },
    );
  }

  void _imageOnClick({
    required BuildContext context,
    required WidgetRef ref,
    required String quote,
    required String author,
    required bool isLogged,
  }) {
    if (isLogged) {
      showDialog(
        context: context,
        builder: (ctx) => _getImageDialog(
          context: ctx,
          ref: ref,
          quote: quote,
          author: author,
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => CommonDialog(
          title: "로그인 후 사용하실 수 있습니다.",
          okButtonText: "로그인 하기",
          okButtonOnClick: () {
            Navigator.pop(ctx);
            LoginRoute()..push(ctx);
          },
          cancelButtonOnClick: () => Navigator.pop(ctx),
        ),
      );
    }
  }
}

class _QuoteSectionSkeleton extends StatelessWidget {
  final FillsaColorScheme colorScheme;

  const _QuoteSectionSkeleton({required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.backgroundContainer,
        boxShadow: [
          const BoxShadow(
            color: Color(0xB3CBC0A8),
            offset: Offset(0, 0),
            blurRadius: 16,
            spreadRadius: -3,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: AspectRatio(
        aspectRatio: 320 / 250.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _SkeletonLine(
                  width: double.infinity,
                  height: 14,
                  colorScheme: colorScheme),
              const SizedBox(height: 10),
              _SkeletonLine(
                  width: double.infinity,
                  height: 14,
                  colorScheme: colorScheme),
              const SizedBox(height: 10),
              _SkeletonLine(
                  width: 180, height: 14, colorScheme: colorScheme),
              const SizedBox(height: 24),
              _SkeletonLine(
                  width: 80, height: 12, colorScheme: colorScheme),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkeletonLine extends StatelessWidget {
  final double width;
  final double height;
  final FillsaColorScheme colorScheme;

  const _SkeletonLine({
    required this.width,
    required this.height,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colorScheme.outlineVariant,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
