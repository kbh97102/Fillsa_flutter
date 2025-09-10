import 'dart:math' as math;

import 'package:fillsa_flutter/presentation/ui/common/my_deferred_pointer.dart';
import 'package:fillsa_flutter/presentation/ui/home/quote_body.dart';
import 'package:flutter/widgets.dart';

import '../../util/colors.dart' as Colors;
import '../../util/logger.dart';
import '../guide/custom_svg.dart';

class QuoteSection extends StatelessWidget {
  final String quote;
  final String author;
  final VoidCallback beforeOnClick;
  final VoidCallback afterOnClick;

  const QuoteSection({
    super.key,
    required this.quote,
    required this.author,
    required this.beforeOnClick,
    required this.afterOnClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xB3CBC0A8), // #CBC0A8 + 70% 알파 = B3
            offset: const Offset(0, 0), // X, Y
            blurRadius: 16,
            spreadRadius: -3,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AspectRatio(
            aspectRatio: 320 / 250.0,
            child: CustomMultiChildLayout(
              delegate: _TestDelegate(),
              children: [
                LayoutId(
                  id: "body",
                  child: QuoteBody(quote: quote, author: author),
                ),
                LayoutId(
                  id: "start",
                  child: MyDeferPointer(
                    child: GestureDetector(
                      child: CustomSvg(svgName: "icn_arrow_filled"),
                      onTap: () {
                        logger.e("Click Before");
                        beforeOnClick();
                      },
                    ),
                  ),
                ),
                LayoutId(
                  id: "end",
                  child: MyDeferPointer(
                    child: Transform.rotate(
                      angle: math.pi,
                      child: GestureDetector(
                        child: CustomSvg(svgName: "icn_arrow_filled"),
                        onTap: afterOnClick,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TestDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    if (hasChild("body")) {
      layoutChild("body", BoxConstraints.tight(size));
      positionChild("body", Offset.zero);
    }

    final double buttonY = size.height / 2 - 16;

    if (hasChild("start")) {
      layoutChild("start", BoxConstraints.tight(const Size(32, 32)));
      positionChild("start", Offset(-16, buttonY));
    }

    // 💡 오른쪽 화살표
    if (hasChild("end")) {
      layoutChild("end", BoxConstraints.tight(const Size(32, 32)));
      positionChild("end", Offset(size.width - 16, buttonY));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
