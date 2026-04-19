import 'package:flutter/material.dart';

import '../../util/colors.dart';
import '../../util/extensions.dart';

enum QuoteListEmptyType { noItems, noResults }

class QuoteListEmptySection extends StatelessWidget {
  final QuoteListEmptyType type;

  const QuoteListEmptySection({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final isNoItems = type == QuoteListEmptyType.noItems;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _EmptyIcon(isNoItems: isNoItems),
          const SizedBox(height: 20),
          Text(
            isNoItems ? '텅 비었어요!' : '조회 결과가 없어요 :(',
            style: context.fillsaTypo.subtitle1.copyWith(color: purple01),
          ),
          const SizedBox(height: 8),
          Text(
            isNoItems
                ? '필사하거나 좋아요한 문장이 여기에 보여요 :)'
                : '기간을 다시 선택해주세요.',
            style: context.fillsaTypo.body3.copyWith(color: grey400),
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
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          if (isNoItems)
            _dashedBoxIcon()
          else
            _calendarIcon(),
          Positioned(
            right: 4,
            bottom: 4,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: yellow02,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashedBoxIcon() {
    return CustomPaint(
      size: const Size(80, 80),
      painter: _DashedBoxPainter(),
    );
  }

  Widget _calendarIcon() {
    return Icon(Icons.calendar_month_outlined, size: 80, color: purple01);
  }
}

class _DashedBoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = purple01
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 6.0;
    const dashSpace = 4.0;
    final radius = Radius.circular(8);
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
