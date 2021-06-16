import 'package:flutter/material.dart';
import 'package:flutter_app_bmi_calculator/page/main_page.dart';
import 'package:flutter_app_bmi_calculator/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
