import 'package:fillsa_flutter/ui/guide/custom_svg.dart';
import 'package:flutter/material.dart';

class GuideImageSection extends StatelessWidget {
  GuideImageSection({super.key});

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: [
        CustomSvg(svgName: "guide_image_1"),
        CustomSvg(svgName: "guide_image_2"),
        CustomSvg(svgName: "guide_image_3"),
      ],
    );
  }
}
