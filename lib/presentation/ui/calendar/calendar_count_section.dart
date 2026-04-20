import 'package:flutter/material.dart';

import '../../theme/fillsa_color_scheme.dart';
import '../../util/extensions.dart';

class CalendarCountSection extends StatelessWidget {
  final int typingCount;
  final int likeCount;
  final int streakCount;
  final bool isLoading;
  final VoidCallback onTap;

  const CalendarCountSection({
    super.key,
    required this.typingCount,
    required this.likeCount,
    required this.streakCount,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: isLoading
            ? _SkeletonRow()
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _CountItem(icon: '📓', count: typingCount, context: context),
                  const SizedBox(width: 16),
                  _CountItem(icon: '❤️', count: likeCount, context: context),
                  const SizedBox(width: 16),
                  _CountItem(icon: '🔥', count: streakCount, context: context),
                ],
              ),
      ),
    );
  }
}

class _SkeletonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = FillsaColorScheme.of(context).outlineVariant;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return Padding(
          padding: EdgeInsets.only(left: i == 0 ? 0 : 16),
          child: Container(
            width: 48,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }),
    );
  }
}

class _CountItem extends StatelessWidget {
  final String icon;
  final int count;
  final BuildContext context;

  const _CountItem({
    required this.icon,
    required this.count,
    required this.context,
  });

  @override
  Widget build(BuildContext _) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(icon, style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 4),
        Text(
          '$count',
          style: context.fillsaTypo.body3.copyWith(
            color: FillsaColorScheme.of(context).onBackground1,
          ),
        ),
      ],
    );
  }
}
