import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/fillsa_color_scheme.dart';
import '../../util/extensions.dart';

class _SkeletonLine extends StatelessWidget {
  final double width;
  final double height;

  const _SkeletonLine({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: FillsaColorScheme.of(context).outlineVariant,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class CalendarQuoteSection extends StatelessWidget {
  final DateTime selectedDay;
  final String quote;
  final bool isLoading;
  final VoidCallback onTap;

  const CalendarQuoteSection({
    super.key,
    required this.selectedDay,
    required this.quote,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final dayNum = '${selectedDay.day}';
    final dayOfWeek = DateFormat('E', 'ko_KR').format(selectedDay);

    final colorScheme = FillsaColorScheme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.backgroundContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    dayNum,
                    style: context.fillsaTypo.heading4
                        .copyWith(color: colorScheme.onBackground2),
                  ),
                  Text(
                    '($dayOfWeek)',
                    style: context.fillsaTypo.body4
                        .copyWith(color: colorScheme.onBackground2),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: isLoading
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _SkeletonLine(width: double.infinity, height: 14),
                          const SizedBox(height: 6),
                          _SkeletonLine(width: 140, height: 14),
                        ],
                      )
                    : Text(
                        quote,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: context.fillsaTypo.body3
                            .copyWith(color: colorScheme.onBackground1),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
