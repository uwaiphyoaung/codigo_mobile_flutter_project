import 'dart:convert';

import 'package:codigo_project/general/api/service_endpoint.dart';
import 'package:codigo_project/general/constants/app_constants.dart';
import 'package:codigo_project/general/entity/movie_detail_entity.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../entity/popular_list_res.dart';

class API {

  Future<Response> _getReq(String url) async {
    return await http.get(Uri.parse(url));
  }

  Future<PopularListRes> fetchPopularList() async {
    final response = await _getReq(
        ServiceEndPoint.fetchPopularList("81007a4d5455286b825e43d88badca51"));
    return PopularListRes.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  }

  Future<PopularListRes> fetchUpcommingList({int page=1}) async {
    final response = await _getReq(
        ServiceEndPoint.fetchUpcommingList(AppConstants.apiKey,page));
    return PopularListRes.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  }

  Future<MovieDetailEntity> getMovieDetail(int id) async {
    final response = await _getReq(
        ServiceEndPoint.movieDetail(id, AppConstants.apiKey));
    return MovieDetailEntity.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  }
}