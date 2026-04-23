import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:fillsa_flutter/presentation/util/routes.dart';
import 'package:flutter/material.dart';

import '../guide/custom_svg.dart';

class HomeAppBar extends StatefulWidget {
  final int streakDays;

  const HomeAppBar({
    super.key,
    required this.streakDays,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool _tooltipVisible = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = FillsaColorScheme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 50,
      color: colorScheme.background,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CustomSvg(svgName: 'img_logo', height: 30),
          const Spacer(),
          _StreakArea(
            streakDays: widget.streakDays,
            tooltipVisible: _tooltipVisible,
            isDark: isDark,
            // Android와 동일: streak 영역 클릭 시 항상 툴팁 토글
            onStreakTap: () =>
                setState(() => _tooltipVisible = !_tooltipVisible),
            onTooltipCalendarTap: () {
              setState(() => _tooltipVisible = false);
              CalendarRoute().go(context);
            },
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => MyPageRoute().go(context),
            child: CustomSvg(svgName: 'icn_mypage', width: 24, height: 24),
          ),
        ],
      ),
    );
  }
}

class _StreakArea extends StatelessWidget {
  final int streakDays;
  final bool tooltipVisible;
  final bool isDark;
  final VoidCallback onStreakTap;
  final VoidCallback onTooltipCalendarTap;

  const _StreakArea({
    required this.streakDays,
    required this.tooltipVisible,
    required this.isDark,
    required this.onStreakTap,
    required this.onTooltipCalendarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: onStreakTap,
          child: streakDays > 0
              ? _StreakCount(streakDays: streakDays)
              : const CustomSvg(
                  svgName: 'icn_empty_daily_count', width: 24, height: 24),
        ),
        if (tooltipVisible)
          Positioned(
            top: 32,
            right: 0,
            child: _BubbleTooltip(
              isDark: isDark,
              onCalendarTap: onTooltipCalendarTap,
            ),
          ),
      ],
    );
  }
}

class _StreakCount extends StatelessWidget {
  final int streakDays;

  const _StreakCount({required this.streakDays});

  @override
  Widget build(BuildContext context) {
    final colorScheme = FillsaColorScheme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomSvg(svgName: 'icn_today_complete', width: 20, height: 20),
        const SizedBox(width: 2),
        Text(
          '${streakDays}일',
          // Android와 동일: isTodayWritten 무관하게 onBackground1 고정
          style: context.fillsaTypo.subtitle1.copyWith(
            color: colorScheme.onBackground1,
          ),
        ),
      ],
    );
  }
}

class _BubbleTooltip extends StatelessWidget {
  final bool isDark;
  final VoidCallback onCalendarTap;

  const _BubbleTooltip({required this.isDark, required this.onCalendarTap});

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? const Color(0xFFFFEFCC) : Colors.black;
    final textColor = isDark ? const Color(0xFF212121) : Colors.white;
    final linkColor =
        isDark ? const Color(0xFF5C65FF) : const Color(0xFFFFCB5C);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // 말풍선 꼬리 삼각형 — Android와 동일: 20x18dp
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: CustomPaint(
            size: const Size(20, 18),
            painter: _TrianglePainter(color: bgColor),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '연속 필사를 완료해 주세요!',
                style:
                    context.fillsaTypo.subtitle2.copyWith(color: textColor),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: onCalendarTap,
                child: Text(
                  '나의 필사현황 보기',
                  style: context.fillsaTypo.body4.copyWith(
                    color: linkColor,
                    decoration: TextDecoration.underline,
                    decorationColor: linkColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;

  _TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_TrianglePainter oldDelegate) =>
      oldDelegate.color != color;
}
