import 'package:flutter/material.dart';
import 'package:simplumio/layouts/main_layout.dart';
import 'package:simplumio/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'simplumio',
      theme: ThemeData(
        colorScheme: getAppTheme().colorScheme,
        textTheme: getAppTheme().textTheme,
        navigationBarTheme: getAppTheme().navigationBarTheme,
        scaffoldBackgroundColor: Colors.white
      ),
      home: MainLayout(title: 'wew'),
    );
  }
}
