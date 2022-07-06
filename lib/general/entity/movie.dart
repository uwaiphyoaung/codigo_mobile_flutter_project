import '../constants/app_constants.dart';

class Movie {

  static const String TABLE_NAME = "movie_table";
  static const String COLUMN_AUTO_ID = "auto_id";
  static const String COLUMN_ID = "id";
  static const String COLUMN_BACKDROP_PATH = "backdrop_path";
  static const String COLUMN_TITLE = "title";
  static const String COLUMN_OVERVIEW = "overview";
  static const String COLUMN_IS_FAVORITE = "is_favorite";
  static const String COLUMN_MOVIE_TYPE = "movie_type";


  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  late final bool adult;
  late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final dynamic voteAverage;
  late final int voteCount;
  bool isFavorite = false;
  String movieType = "";

  Movie.fromJson(Map<String, dynamic> json){
    adult = json['adult']?? false;
    backdropPath = json['backdrop_path']??"";
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']??[]);
    id = json['id'];
    originalLanguage = json['original_language']??"";
    originalTitle = json['original_title']??"";
    overview = json['overview']??"";
    popularity = json['popularity']??0.0;
    posterPath = json['poster_path']??"";
    releaseDate = json['release_date']??"";
    title = json['title']??"";
    video = json['video']??false;
    voteAverage = json['vote_average']??0;
    voteCount = json['vote_count']??0;
    isFavorite = (json[COLUMN_IS_FAVORITE]??"false") ==  "true" ? true: false;
    movieType = json[COLUMN_MOVIE_TYPE]??"";
  }

  Map<String, dynamic> toDatabaseJson(MovieType type) {
    final _data = <String, dynamic>{};
    _data[COLUMN_ID] = id;
    _data[COLUMN_BACKDROP_PATH] = backdropPath;
    _data[COLUMN_TITLE] = title;
    _data[COLUMN_OVERVIEW] = overview;
    _data[COLUMN_IS_FAVORITE] = isFavorite?"true":"false";
    _data[COLUMN_MOVIE_TYPE] = type.name;
    return _data;
  }

}