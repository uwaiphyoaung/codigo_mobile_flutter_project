import '../constants/app_constants.dart';

class ServiceEndPoint {
  static String BASE_URL = AppConstants.baseUrl;

  static String fetchPopularList(String apiKey) => "$BASE_URL/popular?api_key=$apiKey";

  static String fetchUpcommingList(String apiKey, int page) => "$BASE_URL/upcoming?api_key=$apiKey&page=$page";

  static String movieDetail(int id, String apiKey) => "$BASE_URL/$id?api_key=$apiKey";
}