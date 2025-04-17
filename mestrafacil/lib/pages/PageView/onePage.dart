import 'package:flutter/material.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.red),
          child: Center(
            child: Text(
              'Olá Mundo',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              color: Colors.yellow,
              height: 100,
              width: MediaQuery.of(context).size.width / 2,
              child: Center(child: Text('Container 1')),
            ),
            Container(
              color: Colors.blue,
              height: 100,
              width: MediaQuery.of(context).size.width / 2,
              child: Center(child: Text('Container 2')),
            ),
          ],
        ),
      ],
    );
  }
}
