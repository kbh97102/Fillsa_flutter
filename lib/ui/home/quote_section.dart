import 'package:fillsa_flutter/ui/home/quote_body.dart';
import 'package:flutter/widgets.dart';

class QuoteSection extends StatelessWidget {
  const QuoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(children: [QuoteBody()]),
    );
  }
}
