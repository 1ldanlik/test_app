import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/provider/theme_provider.dart';
import 'package:test_app/theme.dart';

import 'counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeNotifier, state) {
          return MaterialApp(
            theme: themeNotifier.isDark ? AppTheme.dark : AppTheme.light,
            home: const CounterPage(),
          );
        },
      ),
    );
  }
}
