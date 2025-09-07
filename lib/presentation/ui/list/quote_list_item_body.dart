import 'package:fillsa_flutter/presentation/ui/list/quote_list_item_content.dart';
import 'package:flutter/widgets.dart';

class QuoteListItemBody extends StatelessWidget {
  const QuoteListItemBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // pager
        QuoteListItemContent(),
        // button
        Row(children: [QuoteListItemBody(), QuoteListItemBody()]),
      ],
    );
  }
}
