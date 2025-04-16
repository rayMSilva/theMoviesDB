import 'package:flutter/material.dart';

void main() => runApp(const ScaffoldExampleApp());

class ScaffoldExampleApp extends StatelessWidget {
  const ScaffoldExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ScaffoldExample(title: 'Operação de Incremento'),
    );
  }
}

class ScaffoldExample extends StatefulWidget {
  const ScaffoldExample({super.key, required this.title});

  final String title;

  @override
  State<ScaffoldExample> createState() => _ScaffoldExampleState();
}

class _ScaffoldExampleState extends State<ScaffoldExample> {
  int _count = 0;

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  void _decrementCounter(){
    if (_count != 0){
      setState(() {
        _count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title, style: Theme.of(context).textTheme.headlineLarge), centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Você incrementou este botão:'
              ),
            Text(
              '$_count vezes',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Incremento',
          child: const Icon(Icons.add, color: Colors.white,),
          backgroundColor: Colors.green,
          ),
          FloatingActionButton(
          onPressed: _decrementCounter,
          tooltip: 'Decremento',
          child: const Icon(Icons.minimize, color: Colors.white),
          backgroundColor: Colors.red,)
        ],
        )
      );
  }
}
