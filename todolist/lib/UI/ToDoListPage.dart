import 'package:flutter/material.dart';
import 'package:todolist/Widgets/appBar.dart';
import 'package:todolist/Widgets/drawer.dart';
import 'package:todolist/Widgets/tarefa.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final TextEditingController _textAddingController =
      TextEditingController(); //novo
  final TextEditingController _textEditingController = TextEditingController();

  List<String> tarefas = [];

  void adicionar() {
    if (_textAddingController.text.isNotEmpty) {
      setState(() {
        tarefas.add(_textAddingController.text);
        _textAddingController.clear();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tarefa adicionada com sucesso!!')),
        );
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Nenhum título digitado!!')));
    }
  }

  void deletarTodos() {
    if (tarefas.isNotEmpty) {
      setState(() {
        tarefas = [];
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Todas tarefas removidas com sucesso!!')),
        );
      });
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Nenhuma tarefa encontrada!!')));
    }
  }

  void editar(String edicao, int index) {
    setState(() {
      tarefas[index] = edicao;
      _textEditingController.clear();
      Navigator.of(context).pop();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Tarefa editada com sucesso!!')));
    });
  }

  void deletar(int index) {
    setState(() {
      tarefas.removeAt(index);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Tarefa removida com sucesso!!')));
    });
  }

  void adicionarTarefaDialogButton() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nova Tarefa'),
          content: TextField(
            controller: _textAddingController,
            decoration: InputDecoration(hintText: 'Digite o título da tarefa'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                adicionar();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void deletarTarefaDialogButton() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remover'),
          content: Text(
            '?!Certeza que deseja remover todos as tarefas do dia!?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                deletarTodos();
              },
              child: Text('APAGAR'),
            ),
          ],
        );
      },
    );
  }

  void slideEdit(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Tarefa'),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: 'Digite o título da tarefa'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                editar(_textEditingController.text, index);
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void slideRemove(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remover'),
          content: Text('?!Certeza que deseja remover esta tarefa do dia!?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                deletar(index);
              },
              child: Text('APAGAR'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: 'Agenda'),
      drawer: MyAppDrawer(),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            Container(
              height: 600,
              margin: EdgeInsets.only(top: 30),
              child: ListView.builder(
                //novo //novo
                itemCount: tarefas.length, //novo
                itemBuilder: (context, index) {
                  //novo
                  return Tarefa(
                    nomeTarefa: tarefas[index],
                    deletar: () {
                      slideRemove(index);
                    },
                    editar: () {
                      slideEdit(index);
                    },
                  );
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
                adicionarTarefaDialogButton();
              },
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              deletarTarefaDialogButton();
            },
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
