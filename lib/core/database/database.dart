import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo/feature/todo/models/todo_model.dart';

class DBProvider {
  static const int _version = 1;
  static const String _dbName = "Todos.db";
  // Singleton instance
  static final DBProvider instance = DBProvider._internal();
  factory DBProvider() => instance;
  DBProvider._internal();

  static Database? _database;

  // Get database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _getDB();
    return _database!;
  }

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
        '''
          CREATE TABLE Todo (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT NOT NULL,
            location TEXT NOT NULL,
            start_time INTEGER NOT NULL,
            end_time INTEGER NOT NULL,
            color INTEGER NOT NULL,
            tags TEXT NOT NULL,
            repeat_type TEXT NOT NULL,
            repeat_end_date INTEGER,
            is_completed INTEGER NOT NULL DEFAULT 0,
            priority INTEGER NOT NULL DEFAULT 2,
            created_at INTEGER NOT NULL,
            updated_at INTEGER NOT NULL     
          )
        '''),
        version: _version);
  }

  Future<int> insertTodo(Todo todo) async {
    final db = await database;
    return await db.insert("Todo", todo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateTodo(Todo todo) async {
    final db = await database;
    return await db.update("Todo", todo.toJson(),
        where: 'id = ?',
        whereArgs: [todo.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> deleteTodo(int todoId) async {
    final db = await database;
    return await db.delete(
      "Todo",
      where: 'id = ?',
      whereArgs: [todoId],
    );
  }

  Future<List<Todo>> getTodos() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query("Todo");

    if (maps.isEmpty) {
      return [];
    }

    return List.generate(maps.length, (index) => Todo.fromJson(maps[index]));
  }
}
