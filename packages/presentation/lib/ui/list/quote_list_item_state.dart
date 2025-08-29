import 'package:flutter/material.dart';
import 'package:presentation/util/extensions.dart';

import '../guide/custom_svg.dart';

class QuoteListItemState extends StatelessWidget {
  const QuoteListItemState({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(153),
            borderRadius: BorderRadiusGeometry.all(Radius.circular(100)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
            child: Row(
              children: [
                CustomSvg(svgName: "icn_memo"),
                SizedBox(width: 4),
                Text("메모", style: context.fillsaTypo.body4),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
