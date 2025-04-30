import 'package:flutter/material.dart';
import 'package:revisao/pages/home_page.dart';
import 'package:revisao/pages/login_page.dart';
import 'package:revisao/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/splash',
      routes: {'/splash': (_) => const SplashPage(),
      '/login': (_) => LoginPage(),
      '/home': (_) => const HomePage()},
    );
  }
}
