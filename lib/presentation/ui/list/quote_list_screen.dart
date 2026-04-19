import 'package:fillsa_flutter/presentation/ui/common/calendar_bar.dart';
import 'package:fillsa_flutter/presentation/ui/list/like_filter.dart';
import 'package:flutter/material.dart';

class QuoteListScreen extends StatelessWidget {
  const QuoteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 날짜 선택바
        CalendarBar(),
        // 좋아요 필터
        LikeFilter(isLiked: false, setIsLike: (value) {}),
        // 명언 리스트
      ],
    );
  }
}
