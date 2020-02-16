import 'package:flutter_todo_local/todolist_database_provider.dart';
import 'package:sqflite/sqflite.dart';

class ToDo {
  final int id;
  final String name;
  final String description;

  ToDo(this.id, this.name, this.description);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'name': name, 'description': description};

    if (id != null) map['id'] = id;
    return map;
  }

  static Future<void> insertToDo(ToDo todo) async {
    final Database db = await ToDoListDatabaseProvider().database;

    await db.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<ToDo>> todos() async {
    final Database db = await ToDoListDatabaseProvider().database;

    final List<Map<String, dynamic>> maps = await db.query('todos');

    return List.generate(maps.length, (i) {
      return ToDo(maps[i]['id'], maps[i]['name'], maps[i]['description']);
    });
  }
}
