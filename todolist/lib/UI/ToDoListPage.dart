import 'package:flutter/material.dart';
import 'package:todolist/Widgets/appBar.dart';
import 'package:todolist/Widgets/drawer.dart';
import 'package:todolist/Widgets/show_dialog.dart';
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

  List<String> tarefas = [
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
    'a',
  ];

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

  Future<void> adicionarTarefaDialogButton() async{
    return await MyDialog.show(
      title: 'Nova Tarefa',
      actions: [
        Acao(
          acao: () {
            Navigator.of(context).pop();
          },
          actionText: 'Cancelar',
        ),
        Acao(acao: () {
          adicionar();
        }, actionText: 'Salvar')
      ],
      dialogContent: TextField(
        controller: _textAddingController,
        decoration: InputDecoration(hintText: 'Digite o Título da tarefa'),
      ),
      context: context,
      dissmissable: false,
    );
  }

  Future<void> deletarTarefaDialogButton() async {
    return await MyDialog.show(
      title: 'Remover Todas Tarefas',
      actions: [
        Acao(
          acao: () {
            Navigator.of(context).pop();
          },
          actionText: 'Cancelar',
        ),
        Acao(
          acao: () {
            deletarTodos();
          },
          actionText: 'Apagar',
        ),
      ],
      dialogContent: Text(
        '?!Certeza que deseja remover todos as tarefas do dia!?',
      ),
      context: context,
      dissmissable: false,
    );
  }

  Future<void> slideEdit(int index) async {
    _textEditingController.text = tarefas[index];
    return await MyDialog.show(
      context: context,
      dissmissable: false,
      title: 'Editar Tarefa',
      dialogContent: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(hintText: 'Digite o novo título da tarefa'),
      ),
      actions: [
        Acao(
          acao: () {
            Navigator.of(context).pop();
          },
          actionText: 'Cancelar',
        ),
        Acao(
          acao: () {
            editar(_textEditingController.text, index);
          },
          actionText: 'Salvar',
        ),
      ],
    );
  }

  Future<void> slideRemove(int index) async {
    return await MyDialog.show(
      title: 'Remover Tarefa',
      actions: [
        Acao(
          acao: () {
            Navigator.of(context).pop();
          },
          actionText: 'Cancelar',
        ),
        Acao(
          acao: () {
            deletar(index);
          },
          actionText: 'Apagar',
        ),
      ],
      dialogContent: Text('?!CERTEZA QUE DESEJA REMOVER ESTA TAREFA?!'),
      context: context,
      dissmissable: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: 'Tarefas Diárias'),
      drawer: MyAppDrawer(),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 250,
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
                    editar: () async {
                      await slideEdit(index);
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
