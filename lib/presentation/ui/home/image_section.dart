import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/widgets.dart';

import '../../util/colors.dart';
import '../guide/custom_svg.dart';

class ImageSection extends StatelessWidget {
  final bool isLogin;
  final String? imagePath;

  const ImageSection({super.key, required this.isLogin, this.imagePath});

  @override
  Widget build(BuildContext context) {
    final hasImage = imagePath != null && imagePath!.isNotEmpty;

    return AspectRatio(
      aspectRatio: 155 / 120.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            if (hasImage)
              SizedBox.expand(
                child: Image.network(
                  imagePath!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      CustomSvg(svgName: "img_share_1", fit: BoxFit.fill),
                ),
              )
            else
              CustomSvg(svgName: "img_share_1", fit: BoxFit.fill),
            if (!isLogin) ...[
              Container(color: grey700.withOpacityPercent(60)),
              const Center(child: _LockIcon()),
            ],
          ],
        ),
      ),
    );
  }
}

class _LockIcon extends StatelessWidget {
  const _LockIcon();

  @override
  Widget build(BuildContext context) => CustomSvg(svgName: "icn_lock");
}
