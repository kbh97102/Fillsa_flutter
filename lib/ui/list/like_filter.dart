import 'package:fillsa_flutter/ui/guide/custom_svg.dart';
import 'package:flutter/cupertino.dart';

class LikeFilter extends StatelessWidget {
  const LikeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [CustomSvg(svgName: "icn_heart_fill"), Text("좋아요")]);
  }
}
