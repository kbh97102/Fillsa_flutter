import 'package:fillsa_flutter/di_config.dart';
import 'package:fillsa_flutter/domain/model/api_result.dart';
import 'package:fillsa_flutter/domain/model/response/NoticeResponse.dart';
import 'package:fillsa_flutter/domain/usecase/get_notice_usecase.dart';
import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _noticeProvider = FutureProvider.autoDispose<List<NoticeResponse>>((ref) async {
  final useCase = getIt<GetNoticeUseCase>();
  final result = await useCase(page: 0, size: 20);
  return switch (result) {
    Success(data: final data) => data.content,
    Fail() => [],
  };
});

class NoticeScreen extends ConsumerWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(_noticeProvider);

    final colors = FillsaColorScheme.of(context);
    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.onBackground1),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          '공지사항',
          style: context.fillsaTypo.subtitle1.copyWith(
            color: colors.onBackground1,
          ),
        ),
      ),
      body: async.when(
        data: (notices) => notices.isEmpty
            ? Center(
                child: Text(
                  '공지사항이 없습니다.',
                  style: context.fillsaTypo.body2.copyWith(
                    color: colors.onBackground1,
                  ),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: notices.length,
                separatorBuilder: (_, __) => Divider(
                  height: 1,
                  color: colors.outlineVariant,
                ),
                itemBuilder: (context, index) {
                  final notice = notices[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    title: Text(
                      notice.title,
                      style: context.fillsaTypo.subtitle1.copyWith(
                        color: colors.onBackground1,
                      ),
                    ),
                    subtitle: Text(
                      notice.createdAt,
                      style: context.fillsaTypo.body2.copyWith(
                        color: colors.onBackground1,
                      ),
                    ),
                    onTap: () => _showDetail(context, notice),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Text(
            '불러오기 실패',
            style: context.fillsaTypo.body2.copyWith(
              color: colors.onBackground1,
            ),
          ),
        ),
      ),
    );
  }

  void _showDetail(BuildContext context, NoticeResponse notice) {
    final colors = FillsaColorScheme.of(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.backgroundContainer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        expand: false,
        builder: (_, controller) => Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            controller: controller,
            children: [
              Text(
                notice.title,
                style: context.fillsaTypo.subtitle1.copyWith(
                  color: colors.onBackground1,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                notice.createdAt,
                style: context.fillsaTypo.body2.copyWith(
                  color: colors.onBackground1,
                ),
              ),
              Divider(height: 24, color: colors.outlineVariant),
              Text(
                notice.content,
                style: context.fillsaTypo.body2.copyWith(
                  color: colors.onBackground1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
