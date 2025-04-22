import 'package:flutter/material.dart';
import 'package:todolist/Widgets/tarefa.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  TextEditingController _textEditingController = TextEditingController(); //novo

  List<String> tarefas = []; 

  void adicionar() 
  {
    setState(() {
      if (_textEditingController.text.length > 0) {
        tarefas.add(_textEditingController.text);
        _textEditingController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tarefas')), 
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            TextField(controller: _textEditingController, onSubmitted: (value) {
              adicionar();
            },), //novo
            Container(
              height: 400,
              child: ListView.separated( //novo
                separatorBuilder: (context, index) => Divider(),//novo
                itemCount: tarefas.length,//novo
                itemBuilder: (context, index) {//novo
                  return Tarefa(nomeTarefa: tarefas[index], deletar: () {
                    setState(() {
                      tarefas.removeAt(index);
                    });
                  });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                if (_textEditingController.text.length > 0) {
                  adicionar();//novo
                }
              },
              child: Icon(Icons.add),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              if (tarefas.length > 0) {
                setState(() {
                  tarefas = [];
                });
                _textEditingController.clear();
              }
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
