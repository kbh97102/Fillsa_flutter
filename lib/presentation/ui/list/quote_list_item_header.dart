import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

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
    final colors = FillsaColorScheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 27),
      decoration: BoxDecoration(color: colors.secondaryContainer),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: context.fillsaTypo.buttonXSmallBold.copyWith(
              color: colors.onSecondaryContainer1,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            dayOfWeek,
            style: context.fillsaTypo.buttonXSmallNormal.copyWith(
              color: colors.onSecondaryContainer1,
            ),
          ),
        ],
      ),
    );
  }
}
