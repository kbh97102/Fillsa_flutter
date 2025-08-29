import 'package:flutter/material.dart';
import 'package:presentation/util/extensions.dart';

import '../../util/colors.dart';
import '../guide/custom_svg.dart';

class QuoteBody extends StatelessWidget {
  const QuoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: yellow01,
      child: AspectRatio(
        aspectRatio: 320 / 246.5,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: CustomSvg(svgName: "img_quote_background"),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "상황을 가장 잘 활용하는 사람이 가장 좋은 상황을 맞는다.",
                      style: context.textStyles.body2,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        "존 우든",
                        style: context.textStyles.body2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
