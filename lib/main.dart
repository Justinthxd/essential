import 'package:essential/core/router/router.dart';
import 'package:essential/core/theme/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Essential',
      routerConfig: router,
      theme: AppTheme.theme(),
    );
  }
}
