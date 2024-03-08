import 'package:flutter/material.dart';
import 'package:stopwatch_app/src/packages/core/ui/ui.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/stopwatch.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stopwatch App',
      theme: AppThemes.light,
      home: const StopwatchPage(),
    );
  }
}
