import 'package:fillsa_flutter/presentation/util/routes.dart';
import 'package:fillsa_flutter/presentation/util/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'di_config.dart';

final fillsaTheme = ThemeData(
  extensions: <ThemeExtension<dynamic>>[fillsaTypoData],
);

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "local_properties.env");
  await initializeDateFormatting("ko_KR", null);

  runApp(
    ProviderScope(
      // overrides: [
      //   presentation_provider.getDailyNonMemberUseCaseProvider.overrideWith(
      //     (ref) => ref.watch(root_provider.getDailyNonMemberUseCaseProvider),
      //   ),
      // ],
      child: const MyApp(),
    ),
  );
  // runApp(DevMain());
}

class DevMain extends StatelessWidget {
  DevMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: fillsaTheme,
      home: SafeArea(
        child: Container(
          color: Colors.white,
          child: Stack(
            clipBehavior: Clip.none, // Stack 영역 밖의 UI도 그리고, 이벤트도 받게 함
            children: [
              // 기준이 되는 부모 위젯 (예: Container)
              Container(width: 200, height: 100, color: Colors.blue),

              // 부모 위젯의 바깥으로 나가는 자식 위젯
              Positioned(
                top: -25, // 부모 위젯의 상단보다 25px 위로
                left: 50,
                child: GestureDetector(
                  onTap: () {
                    print("Click event received!"); // 이 클릭 이벤트가 정상적으로 동작함
                  },
                  child: Container(width: 50, height: 50, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final _router = GoRouter(
  routes: $appRoutes,
  initialLocation: HomeRoute().location,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: fillsaTheme,
      routerConfig: _router,
      title: "Fillsa",
      supportedLocales: const [Locale('en', 'US'), Locale('ko', 'KR')],
    );
  }
}
