import 'package:flutter/material.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';

import '../../util/colors.dart';

class QuoteListItemHeader extends StatelessWidget {
  final String date;
  final String dayOfWeek;

  const QuoteListItemHeader({
    super.key,
    required this.date,
    required this.dayOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(color: purple02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date, style: context.fillsaTypo.buttonXSmallBold),
          const SizedBox(width: 6),
          Text('($dayOfWeek)', style: context.fillsaTypo.buttonXSmallNormal),
        ],
      ),
    );
  }
}
