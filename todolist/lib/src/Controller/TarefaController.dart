import 'package:flutter/material.dart';
import 'package:todolist/src/Model/TarefaModel.dart';

class Tarefacontroller extends ChangeNotifier {
  List<TarefaModel> tarefas = [];

  void adicionarTarefa(TarefaModel tarefa) {
    tarefas.add(tarefa);
    notifyListeners();
  }

  void editarTarefa(String id, String novoTitulo) {
    final index = tarefas.indexWhere((t) => t.id == id);
    if (id != -1) {
      tarefas[index] = TarefaModel(
        id: tarefas[index].id,
        titulo: novoTitulo,
        dataCriacao: tarefas[index].dataCriacao,
        recorrente: tarefas[index].recorrente,
      );
      notifyListeners();
    }
  }

  void removerTarefa(String id)
  {
    tarefas.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  void limparTodas(){
    tarefas.clear();
    notifyListeners();
  }
}
