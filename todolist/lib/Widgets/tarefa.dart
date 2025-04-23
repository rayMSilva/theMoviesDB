import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Tarefa extends StatefulWidget {
  final String nomeTarefa;
  final Function() deletar;
  final Function() editar;
  const Tarefa({super.key, required this.nomeTarefa, required this.deletar, required this.editar});

  @override
  State<Tarefa> createState() => _TarefaState();
}

class _TarefaState extends State<Tarefa> {
  bool concluida = false;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.nomeTarefa),

      // Ações à esquerda (início)
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              widget.editar();
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Editar',
          ),
        ],
      ),

      // Ações à direita (fim)
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              widget.deletar();
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Excluir',
          ),
        ],
      ),

      // Card que será deslizadoCard(
      child: Card(
        shadowColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(width: 0.5, color: Colors.purple),
        ),
        elevation: 4,
        child: ListTile(
          //nov
          leading: Checkbox(
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
        ),
      ),
    );
  }
}
