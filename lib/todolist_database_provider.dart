import 'package:sqflite/sqlite_api.dart';

import 'database_provider.dart';

class ToDoListDatabaseProvider extends DatabaseProvider {
  @override
  String get databaseName => 'todo_list.db';

  @override
  String get tableName => 'todos';

  createDatabase(Database db, int version) => db.execute(
        """
    CREATE TABLE $tableName(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    description TEXT
    );
    END;
    """,
      );
}
