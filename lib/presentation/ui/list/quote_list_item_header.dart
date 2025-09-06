import 'package:flutter/material.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';

import '../../util/colors.dart';

class QuoteListItemHeader extends StatelessWidget {
  const QuoteListItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(color: purple02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("2025.03.25", style: context.fillsaTypo.buttonXSmallBold),
          const SizedBox(width: 6),
          Text("(수)", style: context.fillsaTypo.buttonXSmallNormal),
        ],
      ),
    );
  }
}
