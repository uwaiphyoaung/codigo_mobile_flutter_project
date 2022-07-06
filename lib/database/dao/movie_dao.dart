import 'package:sqflite/sqflite.dart';
import '../../general/constants/app_constants.dart';
import '../../general/entity/movie.dart';
import '../app_database.dart';

class MovieDao{
  final dbProvider = DatabaseProvider.dbProvider;

  add(Movie data, MovieType type) async {
    final db = await dbProvider.database;
    Future<int> record = db.insert(Movie.TABLE_NAME, data.toDatabaseJson(type),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateWishlistStatus(String status, int productId, String movieType) async {
    final db = await dbProvider.database;
    await db.rawUpdate(
      'UPDATE ${Movie.TABLE_NAME} SET ${Movie.COLUMN_IS_FAVORITE} = ? WHERE ${Movie.COLUMN_ID} = ? AND ${Movie.COLUMN_MOVIE_TYPE} = ?',
      [status, productId, '$movieType'],
    );
  }

  deleteAll(MovieType type) async {
    var db = await dbProvider.database;
    db.delete(Movie.TABLE_NAME, where: '${Movie.COLUMN_MOVIE_TYPE} = ?', whereArgs: [type.name]);
  }

  Future<List<Movie>> getAllItems(MovieType type) async {
    final db = await dbProvider.database;
    var allProductsRecord = await db.query(Movie.TABLE_NAME, columns: [
      Movie.COLUMN_ID,
      Movie.COLUMN_BACKDROP_PATH,
      Movie.COLUMN_TITLE,
      Movie.COLUMN_OVERVIEW,
      Movie.COLUMN_IS_FAVORITE,
      Movie.COLUMN_MOVIE_TYPE,
    ], where: '${Movie.COLUMN_MOVIE_TYPE} = ?', whereArgs: [type.name]);

    List<Movie> datas = [];
    allProductsRecord.forEach((productRecord) {
      Movie data = Movie.fromJson(productRecord);
      datas.add(data);
    });
    return datas;
  }
}