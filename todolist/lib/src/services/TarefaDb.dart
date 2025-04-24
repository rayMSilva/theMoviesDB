import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../Model/TarefaModel.dart';

class TarefaDb {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  static Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'tarefas.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
        CREATE TABLE tarefas(
        id TEXT PRIMARY KEY,
        titulo TEXT,
        dataCriacao TEXT,
        recorrente INTEGER,
        diasSemana TEXT 
        )
    ''');
      },
    );
  }

  static Future<void> inserirTarefa(TarefaModel tarefa) async {
    final db = await database;
    await db.insert(
      'tarefas',
      tarefa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<TarefaModel>> carregarTarefas() async {
    final db = await database;
    final maps = await db.query('tarefas');
    return maps.map((map) => TarefaModel.fromMap(map)).toList();
  }

  static Future<void> limparTodas() async {
    final db = await database;
    await db.delete('tarefas');
  }

  static Future<void> atualizarTarefa(TarefaModel tarefa) async {
    final db = await database;
    await db.update('tarefas', tarefa.toMap(), where: 'id = ?', whereArgs: [tarefa.id]);
  }
}
