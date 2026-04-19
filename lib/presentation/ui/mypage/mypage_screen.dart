import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/ui/mypage/mypage_bottom_button_section.dart';
import 'package:fillsa_flutter/presentation/ui/mypage/mypage_item.dart';
import 'package:fillsa_flutter/presentation/ui/mypage/mypage_login_section.dart';
import 'package:fillsa_flutter/presentation/ui/mypage/mypage_provider.dart';
import 'package:fillsa_flutter/presentation/ui/mypage/theme_dialog.dart';
import 'package:fillsa_flutter/presentation/util/routes.dart';
import 'package:fillsa_flutter/presentation/util/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../guide/custom_svg.dart';

class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(myPageViewModelProvider);
    final viewModel = ref.read(myPageViewModelProvider.notifier);

    final themeAsync = ref.watch(themeModeProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);

    return asyncState.when(
      data: (state) => _MyPageContent(
        isLogged: state.isLogged,
        userName: state.userName,
        imageUri: state.imageUri,
        currentTheme: themeAsync.asData?.value ?? ThemeMode.system,
        onLoginTap: () => LoginRoute().go(context),
        onLogout: viewModel.logout,
        onThemeChanged: themeNotifier.setMode,
      ),
      loading: () => Scaffold(
        backgroundColor: FillsaColorScheme.of(context).background,
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => Scaffold(
        backgroundColor: FillsaColorScheme.of(context).background,
        body: const Center(child: Text('오류가 발생했습니다.')),
      ),
    );
  }
}

class _MyPageContent extends StatelessWidget {
  final bool isLogged;
  final String userName;
  final String? imageUri;
  final ThemeMode currentTheme;
  final VoidCallback onLoginTap;
  final VoidCallback onLogout;
  final ValueChanged<ThemeMode> onThemeChanged;

  const _MyPageContent({
    required this.isLogged,
    required this.userName,
    required this.imageUri,
    required this.currentTheme,
    required this.onLoginTap,
    required this.onLogout,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 로고
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: GestureDetector(
                    onTap: () => const HomeRoute().go(context),
                    child: CustomSvg(svgName: 'icn_logo', height: 30),
                  ),
                ),
              ),

              // 로그인 / 회원 섹션
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: MyPageLoginSection(
                  isLogged: isLogged,
                  userName: userName,
                  imageUri: imageUri,
                  onLoginTap: onLoginTap,
                ),
              ),

              // 공지사항
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: MyPageItem(
                  icon: Icons.info_outline,
                  text: '공지사항',
                  onClick: () => const NoticeRoute().push(context),
                ),
              ),

              // 알림
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: MyPageItem(
                  icon: Icons.notifications_none,
                  text: '알림',
                  onClick: () => const AlertRoute().push(context),
                ),
              ),

              // 테마
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: MyPageItem(
                  icon: Icons.palette_outlined,
                  text: '테마',
                  onClick: () => showDialog(
                    context: context,
                    builder: (_) => ThemeDialog(
                      current: currentTheme,
                      onChanged: onThemeChanged,
                    ),
                  ),
                ),
              ),

              // 버전 / 로그아웃
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: MyPageBottomButtonSection(
                  isLogged: isLogged,
                  onLogout: onLogout,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
