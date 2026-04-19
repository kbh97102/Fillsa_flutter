import 'package:fillsa_flutter/presentation/ui/guide/custom_svg.dart';
import 'package:fillsa_flutter/presentation/util/colors.dart';
import 'package:flutter/material.dart';

class CalendarBar extends StatelessWidget {
  const CalendarBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: yellow01,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            // 아이콘
            CustomSvg(svgName: "icn_calendar"),
            SizedBox(width: 10),
            // 날짜 텍스트asdfasdfasdf0
            Text("2025.03.17 - 2025.03.23 "),
            // 화살표 아이콘
            CustomSvg(svgName: "icn_arrow_down"),
          ],
        ),
      ),
    );
  }
}
