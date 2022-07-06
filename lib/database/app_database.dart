import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../general/entity/movie.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database? _database;

  Future<Database> get database async {
    _database ??= await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    var database = await openDatabase(join(dbPath, "moviedb"),
        version: 1,
        onCreate: initDB,
        onUpgrade: onUpgrade,
        onDowngrade: onDatabaseDowngradeDelete);
    return database;
  }

  void onUpgrade(
    Database database,
    int oldVersion,
    int newVersion,
  ) {
    if (newVersion > oldVersion) {
      v2Changes(database);
    }
  }

  void initDB(Database database, int version) async {
    //Dropping tables
    await database.execute('DROP TABLE IF EXISTS ${Movie.TABLE_NAME}');
    //create tables
    movieTableCreate(database);
  }

  void v2Changes(Database db) async {
    await db.execute('DROP TABLE IF EXISTS ${Movie.TABLE_NAME}');
    movieTableCreate(db);
  }

  void movieTableCreate(Database database) async {
    await database.execute("CREATE TABLE IF NOT EXISTS ${Movie.TABLE_NAME} ("
        "${Movie.COLUMN_AUTO_ID} INTEGER PRIMARY KEY AUTOINCREMENT,"
        "${Movie.COLUMN_ID} INTEGER,"
        "${Movie.COLUMN_BACKDROP_PATH} TEXT,"
        "${Movie.COLUMN_TITLE} TEXT,"
        "${Movie.COLUMN_OVERVIEW} TEXT,"
        "${Movie.COLUMN_IS_FAVORITE} TEXT,"
        "${Movie.COLUMN_MOVIE_TYPE} TEXT"
        ")");
  }
}
