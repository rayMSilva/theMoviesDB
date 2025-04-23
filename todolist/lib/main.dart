import 'package:flutter/material.dart';
import 'package:todolist/UI/ToDoListPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoListPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
        );
  }
}
