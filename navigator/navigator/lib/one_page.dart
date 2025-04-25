import 'package:flutter/material.dart';
import 'package:navigator/two_page.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed('/twoPage', arguments: 'Teste')
                .then((value) => print(value));
          },
          child: Text('Ir paga a Segunda Page'),
        ),
      ),
    );
  }
}
