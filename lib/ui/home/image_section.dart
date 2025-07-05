import 'package:fillsa_flutter/ui/guide/custom_svg.dart';
import 'package:fillsa_flutter/util/colors.dart';
import 'package:fillsa_flutter/util/extensions.dart';
import 'package:flutter/widgets.dart';

class ImageSection extends StatelessWidget {
  final bool isLogin;

  const ImageSection({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 155 / 120.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            CustomSvg(svgName: "img_default_background", fit: BoxFit.fill),
            if (!isLogin) ...[
              Container(color: grey700.withOpacityPercent(60)),
              Center(child: CustomSvg(svgName: "icn_lock")),
            ],
          ],
        ),
      ),
    );
  }
}
