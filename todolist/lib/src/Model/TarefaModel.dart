class TarefaModel {
  final String id;
  final String titulo;
  final DateTime dataCriacao;
  final bool recorrente;
  final List<int>? diasSemana;

  TarefaModel({
    required this.id,
    required this.titulo,
    required this.dataCriacao,
    required this.recorrente,
    this.diasSemana,
  });

  factory TarefaModel.fromMap(Map<String, dynamic> map) {
    return TarefaModel(
      id: map['id'],
      titulo: map['titulo'],
      dataCriacao: DateTime.parse(map['dataCriacao']),
      recorrente: map['recorrente'] == 1,
      diasSemana:
          map['diasSemana'] != null
              ? (map['diasSemana'] as String)
                  .split(',')
                  .map((e) => int.parse(e))
                  .toList()
              : null,
    );
  }

  Map<String, dynamic> toMap(){
    return {'id': id,
            'titulo': titulo,
            'dataCriacao': dataCriacao,
            'recorrente': recorrente,
            'diasSemana': diasSemana?.join(',')};
  }
}
