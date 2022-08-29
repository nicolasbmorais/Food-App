import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primaryColor: AppColors.kAccentColor,
        scaffoldBackgroundColor: AppColors.kBgColor,
        fontFamily: "SF Pro Text",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}
