import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 4),
    ).then((value) => Navigator.of(context).pushReplacementNamed('/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.green,child: Center(child: CircularProgressIndicator(color: Colors.white,))));
  }
}
