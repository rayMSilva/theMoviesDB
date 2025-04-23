import 'package:flutter/material.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Ray'),
            accountEmail: Text('Ray@email.com'),
            currentAccountPicture: CircleAvatar(child: Text('R')),
          ),
        ],
      ),
    );
  }
}
