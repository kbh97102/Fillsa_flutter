import 'package:fillsa_flutter/presentation/ui/list/quote_list_item_content.dart';
import 'package:fillsa_flutter/presentation/ui/list/quote_list_item_header.dart';
import 'package:flutter/material.dart';

class QuoteListItem extends StatelessWidget {
  final String date;
  final String dayOfWeek;
  final String quote;
  final String? memo;
  final bool hasMemo;
  final bool isLiked;
  final String? imagePath;
  final VoidCallback? onLikeTap;
  final VoidCallback? onMemoTap;
  final VoidCallback? onItemTap;

  const QuoteListItem({
    super.key,
    required this.date,
    required this.dayOfWeek,
    required this.quote,
    this.memo,
    required this.hasMemo,
    required this.isLiked,
    this.imagePath,
    this.onLikeTap,
    this.onMemoTap,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: AspectRatio(
        aspectRatio: 150.0 / 200.0,
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              QuoteListItemHeader(date: date, dayOfWeek: dayOfWeek),
              Expanded(
                child: QuoteListItemContent(
                  quote: quote,
                  memo: memo,
                  hasMemo: hasMemo,
                  isLiked: isLiked,
                  imagePath: imagePath,
                  onLikeTap: onLikeTap,
                  onMemoTap: onMemoTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
