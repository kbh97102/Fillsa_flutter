import 'package:fillsa_flutter/routes.dart';
import 'package:fillsa_flutter/ui/list/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting("ko_KR", null);

  // runApp(const MyApp());
  runApp(DevMain());
}

class DevMain extends StatefulWidget {
  DevMain({super.key});

  @override
  State<DevMain> createState() => _DevMainState();
}

class _DevMainState extends State<DevMain> {
  bool _liked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Row(
            children: [
              Container(
                child: CustomCheckbox(
                  isLiked: _liked,
                  setIsLike: (bool newValue) {
                    setState(() {
                      _liked = !newValue;
                    });
                  },
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
  initialLocation: LoginRoute().location,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: "Fillsa",
      supportedLocales: const [Locale('en', 'US'), Locale('ko', 'KR')],
    );
  }
}
