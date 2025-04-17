import 'package:flutter/material.dart';

class FourPage extends StatefulWidget {
  const FourPage({super.key});

  @override
  State<FourPage> createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  int _counter = 0;

  void _decrement() {
    if (_counter != 0) {
      _counter--;
      print(_counter);
      setState(() {});
    }
  }

  void _increment() {
    _counter++;
    print(_counter);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: const Text(
              'Você Apertou o Botão',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Text('$_counter Vezes', style: TextStyle(fontSize: 20)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 30),
                child: FloatingActionButton(
                  onPressed: _increment,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
              FloatingActionButton(
                onPressed: _decrement,
                backgroundColor: Colors.red,
                child: Icon(Icons.minimize, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
