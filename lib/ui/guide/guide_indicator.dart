import 'package:fillsa_flutter/ui/guide/guide_indicator_item.dart';
import 'package:flutter/widgets.dart';

class GuideIndicator extends StatelessWidget {
  const GuideIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) => GuideIndicatorItem(isActive: true)),
    );
  }
}
