import 'movie.dart';

class PopularListRes {
  PopularListRes({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<Movie> results;
  late final int totalPages;
  late final int totalResults;

  PopularListRes.fromJson(Map<String, dynamic> json){
    page = json['page'];
    results = List.from(json['results']).map((e)=>Movie.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}