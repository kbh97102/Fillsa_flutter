import 'package:fillsa_flutter/presentation/util/colors.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

class TypingTextDisplay extends StatelessWidget {
  final String quote;
  final String typedText;
  final String composingText;

  const TypingTextDisplay({
    super.key,
    required this.quote,
    required this.typedText,
    this.composingText = '',
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle baseStyle = context.fillsaTypo.body1;
    final int committed = typedText.length.clamp(0, quote.length);
    final bool hasComposing = composingText.isNotEmpty && committed < quote.length;

    final List<TextSpan> spans = [];

    for (int i = 0; i < committed; i++) {
      final bool correct = typedText[i] == quote[i];
      spans.add(TextSpan(
        text: typedText[i],
        style: baseStyle.copyWith(color: correct ? grey700 : Colors.red),
      ));
    }

    if (hasComposing) {
      final bool correct = composingText == quote[committed];
      spans.add(TextSpan(
        text: composingText,
        style: baseStyle.copyWith(
          color: correct ? grey400 : Colors.red.withOpacity(0.6),
        ),
      ));
    }

    final int remainingStart = committed + (hasComposing ? 1 : 0);
    if (remainingStart < quote.length) {
      spans.add(TextSpan(
        text: quote.substring(remainingStart),
        style: baseStyle.copyWith(color: const Color(0xFFCACACA)),
      ));
    }

    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(style: baseStyle, children: spans),
      ),
    );
  }
}
