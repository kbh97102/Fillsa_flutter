import 'package:fillsa_flutter/presentation/ui/common/custom_button.dart';
import 'package:fillsa_flutter/presentation/ui/guide/custom_svg.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

class ImageChangeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomSvg(svgName: "img_share_1", fit: BoxFit.fill),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 삭제하기
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomSvg(svgName: "icn_close", width: 20, height: 20),

                      SizedBox(width: 8),

                      Text(
                        "삭제하기",
                        style: context.fillsaTypo.body2.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 90),

                  // 타이틀
                  Text(
                    "상황을 가장 잘 활용하는 사람이 가장 좋은 상황을 맞는다.",
                    style: context.fillsaTypo.quote,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 12),

                  // 저자
                  Text(
                    "존 우든",
                    style: context.fillsaTypo.quote.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),

                  SizedBox(height: 86),

                  // 버튼
                  Row(
                    children: [
                      CustomButton(buttonText: "이미지 변경"),
                      SizedBox(width: 10),
                      Expanded(child: CustomButton(buttonText: "확인")),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
