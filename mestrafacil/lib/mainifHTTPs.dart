import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Root widget
      home: Scaffold(
        appBar: AppBar(title: const Text('My Home Page')),
        body: Center(
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(10.0),
                    child: Text('Este é o primeiro botao vvvvv'),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        print('Olá eu sou o 1° botao');
                      },
                      child: const Text('1° butao'),
                    ),
                  ),
                  const Text('Este é o segundo botao vvvv'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      http
                          .get(
                            Uri.https(
                              'xptoflutter.free.beeceptor.com',
                              '/test',
                            ),
                          )
                          .then(
                            (value) => print(
                              'Olá eu sou o 2° botao API.Body => ${value.body}',
                            ),
                          );
                    },
                    child: const Text('2° butao'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
