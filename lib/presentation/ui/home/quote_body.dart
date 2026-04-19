import 'package:flutter/material.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';

import '../../util/colors.dart';
import '../guide/custom_svg.dart';

class QuoteBody extends StatelessWidget {
  final String quote;
  final String author;
  const QuoteBody({super.key, required this.quote, required this.author});

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
                      quote,
                      style: context.textStyles.body2,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        author,
                        style: context.textStyles.body2.copyWith(
                          decoration: TextDecoration.underline,
                        ),
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
