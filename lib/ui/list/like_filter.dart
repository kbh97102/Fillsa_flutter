import 'package:fillsa_flutter/ui/guide/custom_svg.dart';
import 'package:fillsa_flutter/util/extensions.dart';
import 'package:flutter/material.dart';

class LikeFilter extends StatelessWidget {
  const LikeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvg(svgName: "icn_heart_fill"),
        Text("좋아요", style: context.fillsaTypo.body1),
      ],
    );
  }
}
