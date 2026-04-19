import 'package:flutter/widgets.dart';

import '../guide/custom_svg.dart';

class InteractionButtonSection extends StatelessWidget {
  final bool isLiked;
  final VoidCallback onCopy;
  final VoidCallback onShare;
  final Function(bool) setIsLiked;

  const InteractionButtonSection({
    super.key,
    required this.isLiked,
    required this.onCopy,
    required this.onShare,
    required this.setIsLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onCopy,
          child: CustomSvg(svgName: "icn_copy"),
        ),
        const SizedBox(width: 40),
        GestureDetector(
          onTap: onShare,
          child: CustomSvg(svgName: "icn_share"),
        ),
        const SizedBox(width: 40),
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
