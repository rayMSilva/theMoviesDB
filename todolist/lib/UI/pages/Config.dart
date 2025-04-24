import 'package:flutter/material.dart';
import 'package:todolist/Widgets/appBar.dart';
import 'package:todolist/Widgets/drawer.dart';

class MyConfig extends StatefulWidget {
  const MyConfig({super.key});

  @override
  State<MyConfig> createState() => _MyConfigState();
}

class _MyConfigState extends State<MyConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: 'Tarefas Recorrentes'),
      drawer: MyAppDrawer(),
      body: Center(child: Text('Menu de configuração de tarefas recorrentes'),),
    );
  }
}
