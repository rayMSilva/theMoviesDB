import 'package:flutter/material.dart';

class Tarefa extends StatefulWidget {
  final String nomeTarefa;
  final Function() deletar;
  const Tarefa({super.key, required this.nomeTarefa, required this.deletar});

  @override
  State<Tarefa> createState() => _TarefaState();
}

class _TarefaState extends State<Tarefa> {
  bool concluida = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //nov
      trailing: Checkbox(
        value: concluida,
        onChanged: (value) {
          setState(() {
            concluida = !concluida;
          });
        },
      ),
      title: Text(
        widget.nomeTarefa,
        style: TextStyle(
          decoration:
              concluida ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ), //novo
      onLongPress: () {
        //novo
        widget.deletar();
      },
    );
  }
}
