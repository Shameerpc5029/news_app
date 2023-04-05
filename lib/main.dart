import 'package:flutter/material.dart';
import 'package:news_app/common/color.dart';
import 'package:news_app/view/home/home_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          centerTitle: false,
          backgroundColor: AppColor.appThemeColor,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
