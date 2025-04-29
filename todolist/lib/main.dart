import 'package:flutter/material.dart';
import 'package:todolist/UI/ToDoListPage.dart';
import 'package:todolist/UI/pages/Config.dart';
import 'package:todolist/UI/pages/User.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (_) => ToDoListPage(),
        '/Profile': (_) => MyUser(),
        '/Config': (_) => MyConfig(),
      },
    );
  }
}
