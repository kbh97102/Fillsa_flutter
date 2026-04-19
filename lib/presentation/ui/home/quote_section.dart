import 'dart:math' as math;

import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/ui/common/my_deferred_pointer.dart';
import 'package:fillsa_flutter/presentation/ui/home/quote_body.dart';
import 'package:fillsa_flutter/presentation/util/DateCondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../util/logger.dart';
import '../guide/custom_svg.dart';

class QuoteSection extends StatelessWidget {
  final String quote;
  final String author;
  final DateTime today;
  final VoidCallback beforeOnClick;
  final VoidCallback afterOnClick;
  final VoidCallback? onQuoteTap;
  final VoidCallback? onAuthorTap;
  late final bool _displayNextButton;
  late final bool _displayBeforeButton;

  QuoteSection({
    super.key,
    required this.quote,
    required this.author,
    required this.beforeOnClick,
    required this.afterOnClick,
    required this.today,
    this.onQuoteTap,
    this.onAuthorTap,
  }) {
    final DateTime nowOnlyDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    _displayNextButton = today.isBefore(nowOnlyDate);
    _displayBeforeButton = !today.isBefore(DateCondition.startDay);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = FillsaColorScheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.backgroundContainer,
        boxShadow: [
          BoxShadow(
            color: const Color(0xB3CBC0A8),
            offset: const Offset(0, 0),
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
            child: GestureDetector(
              behavior: HitTestBehavior.deferToChild,
              onTap: onQuoteTap,
              child: CustomMultiChildLayout(
                delegate: _QuoteSectionDelegate(),
                children: [
                  LayoutId(
                    id: "body",
                    child: QuoteBody(
                      quote: quote,
                      author: author,
                      onAuthorTap: onAuthorTap,
                    ),
                  ),
                  if (_displayBeforeButton)
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
                  if (_displayNextButton)
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
          ),
        ],
      ),
    );
  }
}

class _QuoteSectionDelegate extends MultiChildLayoutDelegate {
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

    if (hasChild("end")) {
      layoutChild("end", BoxConstraints.tight(const Size(32, 32)));
      positionChild("end", Offset(size.width - 16, buttonY));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => false;
}
