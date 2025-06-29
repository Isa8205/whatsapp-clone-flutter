import 'package:first_app/app_router.dart';
import 'package:first_app/src/core/theme/main_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: appRouter,
        themeMode: ThemeMode.dark,
        darkTheme: whatsappDarkTheme,
    );
  }
}