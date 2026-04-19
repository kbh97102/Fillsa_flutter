import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../guide/custom_svg.dart';

class QuoteListItemContent extends StatefulWidget {
  final String quote;
  final String? memo;
  final bool hasMemo;
  final bool isLiked;
  final String? imagePath;
  final VoidCallback? onLikeTap;
  final VoidCallback? onMemoTap;

  const QuoteListItemContent({
    super.key,
    required this.quote,
    this.memo,
    required this.hasMemo,
    required this.isLiked,
    this.imagePath,
    this.onLikeTap,
    this.onMemoTap,
  });

  @override
  State<QuoteListItemContent> createState() => _QuoteListItemContentState();
}

class _QuoteListItemContentState extends State<QuoteListItemContent> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    final pages = [_buildQuotePage(context)];
    if (widget.hasMemo) pages.add(_buildMemoPage(context));
    final count = pages.length;

    return Stack(
      children: [
        PageView(controller: _pageController, children: pages),
        if (count > 1)
          Positioned(
            bottom: 36,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: count,
                onDotClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                effect: WormEffect(
                  dotWidth: 6,
                  dotHeight: 6,
                  dotColor: colors.outlineVariant,
                  activeDotColor: colors.tertiary,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildQuotePage(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        // 배경
        if (widget.imagePath != null && widget.imagePath!.isNotEmpty)
          Image.network(widget.imagePath!, fit: BoxFit.cover)
        else
          Container(color: colors.onBackground1),
        // 명언 텍스트
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 48),
          child: Text(
            widget.quote,
            style: context.fillsaTypo.body4.copyWith(
              color: colors.onPrimaryContainer,
              height: 1.6,
            ),
            maxLines: 7,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        // 하단 버튼 행
        Positioned(
          left: 8,
          right: 8,
          bottom: 8,
          child: Row(
            children: [
              if (widget.hasMemo) ...[
                _PillButton(
                  svgName: 'icn_memo',
                  label: '메모',
                  onTap: widget.onMemoTap,
                ),
                const SizedBox(width: 4),
              ],
              _PillButton(
                svgName: widget.isLiked ? 'icn_heart_fill' : 'icn_heart',
                label: '좋아요',
                onTap: widget.onLikeTap,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMemoPage(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: colors.backgroundContainer),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 48),
          child: Text(
            widget.memo ?? '',
            style: context.fillsaTypo.body4.copyWith(
              color: colors.onBackground1,
              height: 1.6,
            ),
            maxLines: 7,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Positioned(
          left: 8,
          bottom: 8,
          child: _PillButton(
            svgName: 'icn_memo',
            label: '메모',
            onTap: widget.onMemoTap,
          ),
        ),
      ],
    );
  }
}

class _PillButton extends StatelessWidget {
  final String svgName;
  final String label;
  final VoidCallback? onTap;

  const _PillButton({
    required this.svgName,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.backgroundContainer.withAlpha(200),
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 12,
              height: 12,
              child: CustomSvg(svgName: svgName),
            ),
            const SizedBox(width: 3),
            Text(
              label,
              style: context.fillsaTypo.body4.copyWith(
                color: colors.onBackground1,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
