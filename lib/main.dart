import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_show/app/view/home/home_screen.dart';

import 'shared/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      themeMode: ThemeMode.light,
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}
