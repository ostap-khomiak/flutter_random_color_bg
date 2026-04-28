import 'package:flutter/material.dart';
import 'package:flutter_random_color_bg/color_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Color randomizer',
      home: ColorScreen(),
    );
  }
}
