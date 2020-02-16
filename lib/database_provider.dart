import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

// デー5あベース毎にこのクラスを継承したProviderを実装する
abstract class DatabaseProvider {
  Database _instance;
  String get databaseName;
  String get tableName;

  Future<Database> get database async {
    if (_instance == null) {
      _instance = await openDatabase(
          join(
            await getDatabasesPath(),
            databaseName,
          ),
          onCreate: createDatabase,
          version: 1);
    }
    return _instance;
  }

  // DBがpathに存在しなかった場合に onCreateメソッドが呼ばれる
  void createDatabase(Database db, int version);
}
