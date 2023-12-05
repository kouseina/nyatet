import 'package:flutter/material.dart';
import 'package:nyatet/routes/app_router.dart';
import 'package:nyatet/utils/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      
      routerConfig: appRouter.config(),
      theme: Themes.lightTheme,
    );
  }
}
