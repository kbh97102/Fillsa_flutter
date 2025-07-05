import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvg extends StatelessWidget {
  final String svgName;
  final BoxFit fit;

  const CustomSvg({
    super.key,
    required this.svgName,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/images/${svgName}.svg", fit: fit);
  }
}
