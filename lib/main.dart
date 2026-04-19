import 'package:fillsa_flutter/domain/usecase/get_login_status_usecase.dart';
import 'package:fillsa_flutter/presentation/util/login_status_notifier.dart';
import 'package:fillsa_flutter/presentation/util/routes.dart';
import 'package:fillsa_flutter/presentation/theme/app_theme.dart';
import 'package:fillsa_flutter/presentation/util/theme_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';

import 'di_config.dart';
import 'firebase_options.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: "local_properties.env");
  KakaoSdk.init(nativeAppKey: dotenv.maybeGet("KAKAO_KEY") ?? "");
  await initializeDateFormatting("ko_KR", null);

  final getLoginStatus = GetIt.instance<GetLoginStatusUseCase>();
  final initialLoginStatus = await getLoginStatus.call().first;

  final loginStatusNotifier = LoginStatusNotifier(initialLoginStatus ?? false);
  loginStatusNotifier.listenForUpdates(getLoginStatus.call());

  runApp(ProviderScope(child: MyApp(loginStatusNotifier: loginStatusNotifier)));
}


GoRouter _buildRouter(LoginStatusNotifier loginStatusNotifier) {
  return GoRouter(
    routes: $appRoutes,
    initialLocation: loginStatusNotifier.isLoggedIn
        ? HomeRoute().location
        : LoginRoute().location,
    refreshListenable: loginStatusNotifier,
    redirect: (context, state) {
      final isLoggedIn = loginStatusNotifier.isLoggedIn;
      final isLoginRoute = state.matchedLocation == LoginRoute().location;
      if (isLoggedIn && isLoginRoute) return HomeRoute().location;
      if (!isLoggedIn && !isLoginRoute) return LoginRoute().location;
      return null;
    },
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key, required this.loginStatusNotifier});

  final LoginStatusNotifier loginStatusNotifier;

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = _buildRouter(widget.loginStatusNotifier);
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider).asData?.value ?? ThemeMode.system;

    return MaterialApp.router(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: themeMode,
      routerConfig: _router,
      title: "Fillsa",
      supportedLocales: const [Locale('en', 'US'), Locale('ko', 'KR')],
    );
  }
}
