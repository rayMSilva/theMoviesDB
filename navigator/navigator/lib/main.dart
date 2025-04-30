import 'package:flutter/material.dart';
import 'package:navigator/views/one_page.dart';
import 'package:navigator/third_page.dart';
import 'package:navigator/two_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (_) => const OnePage(),
        '/twoPage': (_) => const TwoPage(),
        '/thirdPage': (_) => const ThirdPage(),
      },
    );
  }
}
