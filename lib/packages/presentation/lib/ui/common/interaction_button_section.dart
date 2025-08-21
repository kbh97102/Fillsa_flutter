import 'package:flutter/widgets.dart';

import '../guide/custom_svg.dart';

class InteractionButtonSection extends StatelessWidget {
  const InteractionButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomSvg(svgName: "icn_copy"),
        SizedBox(width: 40),
        CustomSvg(svgName: "icn_share"),
        SizedBox(width: 40),
        CustomSvg(svgName: "icn_heart"),
      ],
    );
  }
}
