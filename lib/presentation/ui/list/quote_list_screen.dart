import 'package:fillsa_flutter/domain/model/local_quote_info.dart';
import 'package:fillsa_flutter/domain/model/response/MemberQuotesResponse.dart';
import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/ui/common/calendar_bar.dart';
import 'package:fillsa_flutter/presentation/ui/list/date_range_picker_overlay.dart';
import 'package:fillsa_flutter/presentation/ui/list/like_filter.dart';
import 'package:fillsa_flutter/presentation/ui/list/list_provider.dart';
import 'package:fillsa_flutter/presentation/ui/list/quote_list_empty_section.dart';
import 'package:fillsa_flutter/presentation/ui/list/quote_list_item.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:fillsa_flutter/presentation/viewmodels/list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class QuoteListScreen extends ConsumerWidget {
  const QuoteListScreen({super.key, this.yearMonth});
  final String? yearMonth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(listViewModelProvider);
    final viewModel = ref.read(listViewModelProvider.notifier);

    final colors = FillsaColorScheme.of(context);
    return Container(
      color: colors.background,
      child: asyncState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('오류가 발생했습니다: $e')),
        data: (state) {
          final fmt = DateFormat('yyyy.MM.dd');
          final items = state.isLogged
              ? state.memberQuotes.map((q) {
                  final date = DateTime.tryParse(q.quoteDate) ?? DateTime.now();
                  return _QuoteItemData(
                    date: fmt.format(date),
                    dayOfWeek: q.quoteDayOfWeek,
                    quote: q.korQuote ?? q.engQuote ?? '',
                    memo: q.memo,
                    hasMemo: q.memoYnString == 'Y',
                    isLiked: q.likeYnString == 'Y',
                    imagePath: q.imagePath,
                    onLikeTap: () => viewModel.updateLike(
                      isLiked: q.likeYnString != 'Y',
                      memberQuote: q,
                    ),
                    onMemoTap: () => _showMemoSheet(
                      context,
                      viewModel,
                      memberQuote: q,
                      currentMemo: q.memo ?? '',
                    ),
                  );
                }).toList()
              : state.localQuotes.map((q) {
                  return _QuoteItemData(
                    date: fmt.format(q.date),
                    dayOfWeek: q.dayOfWeek,
                    quote: q.korQuote.isNotEmpty ? q.korQuote : q.engQuote,
                    memo: q.memo.isNotEmpty ? q.memo : null,
                    hasMemo: q.memo.isNotEmpty,
                    isLiked: q.likeYn == 'Y',
                    imagePath: null,
                    onLikeTap: () => viewModel.updateLike(
                      isLiked: q.likeYn != 'Y',
                      localQuote: q,
                    ),
                    onMemoTap: () => _showMemoSheet(
                      context,
                      viewModel,
                      localQuote: q,
                      currentMemo: q.memo,
                    ),
                  );
                }).toList();

          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CalendarBar
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                    child: CalendarBar(
                      startDate: state.startDate,
                      endDate: state.endDate,
                      expanded: state.showCalendar,
                      onTap: viewModel.toggleCalendar,
                    ),
                  ),
                  // Like filter
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LikeFilter(
                          isLiked: state.likeFilter,
                          setIsLike: (_) =>
                              viewModel.setLikeFilter(!state.likeFilter),
                        ),
                      ],
                    ),
                  ),
                  // 리스트 or 빈 화면
                  Expanded(
                    child: _buildContent(
                      context,
                      items,
                      state.isLoading,
                      state.likeFilter,
                      viewModel,
                    ),
                  ),
                ],
              ),
              // 날짜 선택 캘린더 오버레이
              if (state.showCalendar)
                Positioned(
                  top: 58,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {}, // 내부 탭 버블 방지
                    child: DateRangePickerOverlay(
                      startDate: state.startDate,
                      endDate: state.endDate,
                      onConfirm: (start, end) =>
                          viewModel.setDateRange(start, end),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<_QuoteItemData> items,
    bool isLoading,
    bool likeFilter,
    ListViewModel viewModel,
  ) {
    if (items.isEmpty && !isLoading) {
      return QuoteListEmptySection(
        type: likeFilter
            ? QuoteListEmptyType.noResults
            : QuoteListEmptyType.noItems,
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.pixels >=
                notification.metrics.maxScrollExtent - 200) {
          viewModel.loadMore();
        }
        return false;
      },
      child: GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 150 / 200,
        ),
        itemCount: items.length + (isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == items.length) {
            return const Center(child: CircularProgressIndicator());
          }
          final item = items[index];
          return QuoteListItem(
            date: item.date,
            dayOfWeek: item.dayOfWeek,
            quote: item.quote,
            memo: item.memo,
            hasMemo: item.hasMemo,
            isLiked: item.isLiked,
            imagePath: item.imagePath,
            onLikeTap: item.onLikeTap,
            onMemoTap: item.onMemoTap,
          );
        },
      ),
    );
  }

  void _showMemoSheet(
    BuildContext context,
    ListViewModel viewModel, {
    MemberQuotesResponse? memberQuote,
    LocalQuoteInfo? localQuote,
    required String currentMemo,
  }) {
    final controller = TextEditingController(text: currentMemo);
    final colors = FillsaColorScheme.of(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.backgroundContainer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final sheetColors = FillsaColorScheme.of(ctx);
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: sheetColors.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller,
                autofocus: true,
                maxLines: 5,
                style: ctx.fillsaTypo.body3.copyWith(
                  color: sheetColors.onBackground1,
                ),
                decoration: InputDecoration(
                  hintText: '메모를 입력하세요',
                  hintStyle: ctx.fillsaTypo.body3.copyWith(
                    color: sheetColors.outlineVariant,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: sheetColors.outlineVariant),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: sheetColors.outline),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                    viewModel.saveMemo(
                      memo: controller.text,
                      memberQuote: memberQuote,
                      localQuote: localQuote,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: sheetColors.primaryContainer,
                    foregroundColor: sheetColors.onPrimaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    '저장',
                    style: ctx.fillsaTypo.buttonMediumBold.copyWith(
                      color: sheetColors.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class _QuoteItemData {
  final String date;
  final String dayOfWeek;
  final String quote;
  final String? memo;
  final bool hasMemo;
  final bool isLiked;
  final String? imagePath;
  final VoidCallback onLikeTap;
  final VoidCallback onMemoTap;

  _QuoteItemData({
    required this.date,
    required this.dayOfWeek,
    required this.quote,
    this.memo,
    required this.hasMemo,
    required this.isLiked,
    this.imagePath,
    required this.onLikeTap,
    required this.onMemoTap,
  });
}
