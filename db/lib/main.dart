import 'package:db/pages/home_page.dart';
import 'package:db/pages/login_page.dart';
import 'package:db/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/home': (_) => const HomePage(),
      }
      );
  }
}
