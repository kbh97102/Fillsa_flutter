import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../util/colors.dart';
import '../../util/extensions.dart';

class CalendarQuoteSection extends StatelessWidget {
  final DateTime selectedDay;
  final String quote;
  final VoidCallback onTap;

  const CalendarQuoteSection({
    super.key,
    required this.selectedDay,
    required this.quote,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dayNum = '${selectedDay.day}';
    final dayOfWeek = DateFormat('E', 'ko_KR').format(selectedDay);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
                    style: context.textStyles.heading4.copyWith(color: purple01),
                  ),
                  Text(
                    '($dayOfWeek)',
                    style: context.textStyles.body4.copyWith(color: purple01),
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
                child: Text(
                  quote.isEmpty ? '' : quote,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.body3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
