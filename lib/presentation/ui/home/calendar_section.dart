import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../util/colors.dart';

class CalendarSection extends StatefulWidget {
  final DateTime date;

  CalendarSection({super.key, required this.date});

  @override
  State<CalendarSection> createState() => _CalendarSectionState();
}

class _CalendarSectionState extends State<CalendarSection> {
  final DateFormat _dayFormat = DateFormat("yyyy.MM");

  final DateFormat _dayOfWeekFormat = DateFormat('EEEE', 'ko_KR');

  final DateFormat _dayOfMonth = DateFormat("dd");

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.textStyles.buttonXs;
    final day = _dayFormat.format(widget.date);
    final dayOfWeek = _dayOfWeekFormat.format(widget.date);
    final dayOfMonth = _dayOfMonth.format(widget.date);

    return AspectRatio(
      aspectRatio: 155 / 120.0,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: purple02, width: 1),
        ),
        child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: purple02,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(day, style: titleStyle),
                  Text(dayOfWeek, style: titleStyle),
                ],
              ),
            ),
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayOfMonth,
                    style: context.textStyles.buttonXs.copyWith(fontSize: 40),
                  ),
                ],
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}
