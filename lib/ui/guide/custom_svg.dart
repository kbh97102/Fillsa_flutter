import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvg extends StatelessWidget {
  final String svgName;

  const CustomSvg({super.key, required this.svgName});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/images/${svgName}.svg");
  }
}
