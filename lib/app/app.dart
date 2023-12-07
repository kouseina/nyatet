import 'package:flutter/material.dart';
import 'package:nyatet/routes/app_router.dart';
import 'package:nyatet/app/app_themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      theme: AppThemes.lightTheme,
    );
  }
}
