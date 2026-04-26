import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:fillsa_flutter/presentation/util/login_status_provider.dart';
import 'package:fillsa_flutter/presentation/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../guide/custom_svg.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _logoController;
  late final AnimationController _textController;
  late final AnimationController _dotsController;

  late final Animation<double> _logoFade;
  late final Animation<double> _logoScale;
  late final Animation<double> _textFade;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _dotsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();

    _logoFade = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeOut,
    );
    _logoScale = Tween<double>(begin: 0.82, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutCubic),
    );
    _textFade = CurvedAnimation(
      parent: _textController,
      curve: Curves.easeOut,
    );

    _runSequence();
  }

  Future<void> _runSequence() async {
    await _logoController.forward();
    await Future.delayed(const Duration(milliseconds: 100));
    await _textController.forward();
    await Future.delayed(const Duration(milliseconds: 1100));
    if (mounted) _navigate();
  }

  void _navigate() {
    final isLoggedIn = ref.read(loginStatusNotifierProvider).isLoggedIn;
    if (isLoggedIn) {
      HomeRoute().go(context);
    } else {
      LoginRoute().go(context);
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _dotsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            // 로고
            Center(
              child: ScaleTransition(
                scale: _logoScale,
                child: FadeTransition(
                  opacity: _logoFade,
                  child: CustomSvg(svgName: 'img_logo', height: 52),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // 서브타이틀
            Center(
              child: FadeTransition(
                opacity: _textFade,
                child: Text(
                  '오늘의 필사',
                  style: context.fillsaTypo.body3.copyWith(
                    color: colors.onBackground1,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 3),
            // 바운싱 점 로딩 인디케이터
            Center(
              child: FadeTransition(
                opacity: _textFade,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 52),
                  child: _BouncingDots(
                    controller: _dotsController,
                    color: colors.onBackground2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BouncingDots extends StatelessWidget {
  final AnimationController controller;
  final Color color;

  const _BouncingDots({required this.controller, required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final t = ((controller.value - i / 3) % 1.0).clamp(0.0, 1.0);
            // 0→1→0 형태의 ease: sin 커브로 부드럽게
            final progress = (t * 2 - 1).abs(); // 0→1→0
            final lift = -10.0 * (1 - progress);
            final opacity = 0.35 + 0.65 * (1 - progress);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Transform.translate(
                offset: Offset(0, lift),
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: opacity),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
