class MovieDetailEntity{
late List<GenersData> genres;
late int id;
late String original_language;
late String original_title;
late String overview;
late double popularity;
late String poster_path;
late String release_date;
late List<SpokenLanguage> spoken_languages;
late double vote_average;
late int vote_count;
late int runtime;

MovieDetailEntity(
      this.genres,
      this.id,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.release_date,
      this.spoken_languages,
      this.vote_average,
      this.vote_count,
    this.runtime);

MovieDetailEntity.fromJson(Map<String, dynamic> json){
  genres = List.from(json['genres']).map((e)=>GenersData.fromJson(e)).toList();
  spoken_languages = List.from(json['spoken_languages']).map((e)=>SpokenLanguage.fromJson(e)).toList();
  id = json['id'];
  original_language = json['original_language'];
  original_title = json['original_title'];
  overview = json['overview'];
  popularity = json['popularity'];
  poster_path = json['poster_path'];
  release_date = json['release_date'];
  vote_average = json['vote_average'];
  vote_count = json['vote_count'];
  runtime = json['runtime'];
}
}

class SpokenLanguage{
  late String iso_639_1;
  late String name;
  late String english_name;


  SpokenLanguage(this.iso_639_1, this.name, this.english_name);

  SpokenLanguage.fromJson(Map<String, dynamic> json){
    iso_639_1 = json['iso_639_1'];
    name = json['name'];
    english_name = json['english_name'];
  }
}

class GenersData{
  late int id;
  late String name;

  GenersData(this.id, this.name);

  GenersData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }
}