import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvg extends StatelessWidget {
  final String svgName;
  final BoxFit fit;
  final double? width;
  final double? height;

  const CustomSvg({
    super.key,
    required this.svgName,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/images/${svgName}.svg",
      fit: fit,
      width: width,
      height: height,
    );
  }
}
