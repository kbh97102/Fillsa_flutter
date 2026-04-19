import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CalendarSection extends StatefulWidget {
  final DateTime date;
  final VoidCallback? onTap;

  const CalendarSection({super.key, required this.date, this.onTap});

  @override
  State<CalendarSection> createState() => _CalendarSectionState();
}

class _CalendarSectionState extends State<CalendarSection> {
  final DateFormat _dayFormat = DateFormat("yyyy.MM");
  final DateFormat _dayOfWeekFormat = DateFormat('EEEE', 'ko_KR');
  final DateFormat _dayOfMonth = DateFormat("dd");

  @override
  Widget build(BuildContext context) {
    final colorScheme = FillsaColorScheme.of(context);
    final titleStyle = context.fillsaTypo.buttonXSmallBold.copyWith(
      color: colorScheme.onSecondaryContainer1,
    );
    final day = _dayFormat.format(widget.date);
    final dayOfWeek = _dayOfWeekFormat.format(widget.date);
    final dayOfMonth = _dayOfMonth.format(widget.date);

    return GestureDetector(
      onTap: widget.onTap,
      child: AspectRatio(
        aspectRatio: 155 / 120.0,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.secondaryContainer, width: 1),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: const BorderRadius.only(
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
                    color: colorScheme.backgroundContainer,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dayOfMonth,
                        style: context.fillsaTypo.buttonXSmallBold.copyWith(
                          fontSize: 40,
                          color: colorScheme.onSecondaryContainer1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
