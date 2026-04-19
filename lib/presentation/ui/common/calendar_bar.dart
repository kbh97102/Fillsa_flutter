import 'package:fillsa_flutter/presentation/ui/guide/custom_svg.dart';
import 'package:fillsa_flutter/presentation/util/colors.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarBar extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final bool expanded;
  final VoidCallback? onTap;

  const CalendarBar({
    super.key,
    required this.startDate,
    required this.endDate,
    this.expanded = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat('yyyy.MM.dd');
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: yellow01,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: purple01.withAlpha(80)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              CustomSvg(svgName: 'icn_calendar', width: 18, height: 18),
              const SizedBox(width: 8),
              Text(
                '${fmt.format(startDate)} - ${fmt.format(endDate)}',
                style: context.fillsaTypo.buttonSmallNormal,
              ),
              const Spacer(),
              AnimatedRotation(
                turns: expanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: CustomSvg(svgName: 'icn_arrow_down', width: 18, height: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
