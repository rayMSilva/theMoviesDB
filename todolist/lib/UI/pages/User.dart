import 'package:flutter/material.dart';
import 'package:todolist/Widgets/appBar.dart';
import 'package:todolist/Widgets/drawer.dart';

class MyUser extends StatefulWidget {
  const MyUser({super.key});

  @override
  State<MyUser> createState() => _MyUserState();
}

class _MyUserState extends State<MyUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: 'Perfil do Usuário'),
      drawer: MyAppDrawer(),
      body: Center(child: Text('Esse é meu Usuário'),),
    );
  }
}