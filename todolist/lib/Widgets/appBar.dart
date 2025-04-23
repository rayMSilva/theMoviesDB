import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  const MyAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appBarTitle),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Arial',
        fontSize: 30,
        wordSpacing: 0.2,
      ),
      backgroundColor: Colors.purple,
      foregroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}
