import 'package:flutter/widgets.dart';

import '../guide/custom_svg.dart';

class InteractionButtonSection extends StatelessWidget {
  final bool isLiked;
  final Function(bool) setIsLiked;

  const InteractionButtonSection({
    super.key,
    required this.isLiked,
    required this.setIsLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomSvg(svgName: "icn_copy"),
        SizedBox(width: 40),
        CustomSvg(svgName: "icn_share"),
        SizedBox(width: 40),
        GestureDetector(
          onTap: () {
            setIsLiked.call(!isLiked);
          },
          child: CustomSvg(
            svgName: switch (isLiked) {
              true => "icn_heart_filled",
              _ => "icn_heart",
            },
          ),
        ),
      ],
    );
  }
}
