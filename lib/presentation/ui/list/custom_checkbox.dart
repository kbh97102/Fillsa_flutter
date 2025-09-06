import 'package:flutter/cupertino.dart';

import '../guide/custom_svg.dart';

class CustomCheckbox extends StatelessWidget {
  final String onImage;
  final String offImage;
  final double size;

  final bool isLiked;
  final void Function(bool) setIsLike;

  const CustomCheckbox({
    super.key,
    required this.isLiked,
    required this.setIsLike,
    this.onImage = "icn_checkbox_fill",
    this.offImage = "icn_checkbox_unfill",
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setIsLike(isLiked);
      },
      child: SizedBox(
        width: size,
        height: size,
        child: CustomSvg(svgName: isLiked ? onImage : offImage),
      ),
    );
  }
}
