import 'package:flutter/material.dart';
import 'core/res/style.dart';
import 'core/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // themeMode: isDark ? darkTheme : lightTheme,
      initialRoute: '/',
      routes: Routes.routes,
    );
  }
}
