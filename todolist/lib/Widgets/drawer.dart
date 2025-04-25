import 'package:flutter/material.dart';
import 'package:todolist/UI/ToDoListPage.dart';
import 'package:todolist/UI/pages/Config.dart';
import 'package:todolist/UI/pages/User.dart';

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({super.key});

  @override
  State<MyAppDrawer> createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(message: 'Menu de Navegação',
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Ray'),
              accountEmail: Text('Ray@Email.com'),
              currentAccountPicture: CircleAvatar(child: Text('R')),
            ),
            ListTile(
              title: Text('Perfil'),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => const MyUser()));
              },
            ),
            ListTile(
              title: Text('Tarefas'),
              leading: Icon(Icons.check),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => ToDoListPage()));
              },
            ),
            ListTile(
              title: Text('Configuração de tarefas'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MyConfig()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
