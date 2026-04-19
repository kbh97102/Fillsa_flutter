import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

enum QuoteListEmptyType { noItems, noResults }

class QuoteListEmptySection extends StatelessWidget {
  final QuoteListEmptyType type;

  const QuoteListEmptySection({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    final isNoItems = type == QuoteListEmptyType.noItems;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _EmptyIcon(isNoItems: isNoItems),
          const SizedBox(height: 20),
          Text(
            isNoItems ? '텅 비었어요!' : '조회 결과가 없어요 :(',
            style: context.fillsaTypo.subtitle1.copyWith(
              color: colors.onSecondaryContainer2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isNoItems
                ? '필사하거나 좋아요한 문장이 여기에 보여요 :)'
                : '기간을 다시 선택해주세요.',
            style: context.fillsaTypo.body2.copyWith(
              color: colors.onBackground1,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyIcon extends StatelessWidget {
  final bool isNoItems;
  const _EmptyIcon({required this.isNoItems});

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          if (isNoItems)
            _dashedBoxIcon(colors)
          else
            _calendarIcon(colors),
          Positioned(
            right: 4,
            bottom: 4,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: colors.tertiary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '?',
                  style: context.fillsaTypo.subtitle1.copyWith(
                    color: colors.onTertiary1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashedBoxIcon(FillsaColorScheme colors) {
    return CustomPaint(
      size: const Size(80, 80),
      painter: _DashedBoxPainter(color: colors.outline),
    );
  }

  Widget _calendarIcon(FillsaColorScheme colors) {
    return Icon(Icons.calendar_month_outlined, size: 80, color: colors.outline);
  }
}

class _DashedBoxPainter extends CustomPainter {
  final Color color;

  const _DashedBoxPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 6.0;
    const dashSpace = 4.0;
    const radius = Radius.circular(8);
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      radius,
    );

    final path = Path()..addRRect(rect);
    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      double distance = 0;
      while (distance < metric.length) {
        final next = (distance + dashWidth).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBoxPainter oldDelegate) =>
      oldDelegate.color != color;
}
