import 'package:fillsa_flutter/presentation/ui/common/common_dialog.dart';
import 'package:fillsa_flutter/presentation/ui/mypage/alert_switch_section.dart';
import 'package:fillsa_flutter/presentation/ui/mypage/mypage_provider.dart';
import 'package:fillsa_flutter/presentation/util/colors.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:fillsa_flutter/presentation/viewmodels/mypage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertScreen extends ConsumerWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(myPageViewModelProvider);
    final viewModel = ref.read(myPageViewModelProvider.notifier);

    return asyncState.when(
      data: (state) => _AlertContent(
        isLogged: state.isLogged,
        isAlarmEnabled: state.isAlarmEnabled,
        onAlarmToggle: viewModel.toggleAlarm,
        onWithdraw: () => _showWithdrawDialog(context, viewModel),
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const Scaffold(
        body: Center(child: Text('오류가 발생했습니다.')),
      ),
    );
  }

  void _showWithdrawDialog(BuildContext context, MyPageViewModel viewModel) {
    showDialog(
      context: context,
      builder: (_) => CommonDialog(
        title: '정말로 계정을 삭제하시겠습니까?',
        body: '탈퇴 시 절대로 정보를 복구할 수 없습니다.',
        okButtonText: '취소',
        cancelButtonText: '탈퇴',
        okButtonColor: purple01,
        okTextColor: Colors.white,
        cancelButtonColor: Colors.white,
        cancelTextColor: purple01,
        okButtonBorderColor: purple01,
        cancelButtonBorderColor: purple01,
        okButtonOnClick: () => Navigator.of(context).pop(),
        cancelButtonOnClick: () {
          Navigator.of(context).pop();
          viewModel.withdraw();
        },
      ),
    );
  }
}

class _AlertContent extends StatelessWidget {
  final bool isLogged;
  final bool isAlarmEnabled;
  final ValueChanged<bool> onAlarmToggle;
  final VoidCallback onWithdraw;

  const _AlertContent({
    required this.isLogged,
    required this.isAlarmEnabled,
    required this.onAlarmToggle,
    required this.onWithdraw,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: grey700),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('알림', style: context.fillsaTypo.subtitle1),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AlertSwitchSection(
            selected: isAlarmEnabled,
            onChanged: onAlarmToggle,
          ),
          if (isLogged)
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GestureDetector(
                onTap: onWithdraw,
                child: Container(
                  color: yellow01,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 19,
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('탈퇴하기', style: context.fillsaTypo.body2),
                      const Icon(Icons.logout, color: grey700, size: 20),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
