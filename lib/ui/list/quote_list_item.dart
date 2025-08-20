import 'package:fillsa_flutter/ui/list/quote_list_item_content.dart';
import 'package:fillsa_flutter/ui/list/quote_list_item_header.dart';
import 'package:flutter/material.dart';

class QuoteListItem extends StatelessWidget {
  const QuoteListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 150.0 / 200.0,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(0), // GridView에서 간격을 제어하므로 margin은 0으로 설정
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            QuoteListItemHeader(),
            Expanded(child: QuoteListItemContent()),
          ],
        ),
      ),
    );
  }
}
