import 'package:flutter/widgets.dart';

import 'guide_indicator_item.dart';

class GuideIndicator extends StatelessWidget {
  const GuideIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) => GuideIndicatorItem(isActive: true)),
    );
  }
}
