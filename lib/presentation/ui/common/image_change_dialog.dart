import 'package:fillsa_flutter/presentation/ui/common/custom_button.dart';
import 'package:fillsa_flutter/presentation/ui/guide/custom_svg.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

class ImageChangeDialog extends StatelessWidget {
  final String quote;
  final String author;
  final Function imageChangeOnClick;
  final Function okOnClick;
  final Function deleteOnClick;

  const ImageChangeDialog({
    super.key,
    required this.quote,
    required this.author,
    required this.imageChangeOnClick,
    required this.okOnClick,
    required this.deleteOnClick,
  });

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
                  GestureDetector(
                    onTap: () => deleteOnClick(),
                    child: Row(
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
                  ),

                  SizedBox(height: 90),

                  // 명언
                  Text(
                    quote,
                    style: context.fillsaTypo.quote,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 12),

                  // 저자
                  Text(
                    author,
                    style: context.fillsaTypo.quote.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),

                  SizedBox(height: 86),

                  // 버튼
                  Row(
                    children: [
                      CustomButton(
                        buttonText: "이미지 변경",
                        onClick: imageChangeOnClick,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomButton(
                          buttonText: "확인",
                          onClick: () => okOnClick(),
                        ),
                      ),
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
