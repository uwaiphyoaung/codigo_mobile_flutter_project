import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../database/dao/movie_dao.dart';
import '../../../general/api/app_api.dart';
import '../../../general/constants/app_constants.dart';
import '../../../general/entity/movie.dart';
import '../../../general/entity/popular_list_res.dart';

part 'popular_event.dart';

part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  List<Movie> dataList = [];
  var currentState;
  PopularBloc() : super(PopularInitial()) {
    on<PopularEvent>((event, emit) {});

    on<FetchPopularListEvent>((event, emit) async {
      emit(PopularInitial());
      try {
        final PopularListRes response = await API().fetchPopularList();
       // emit(PopularListSuccessState(response.results));
        MovieDao().deleteAll(MovieType.popular);
        for (Movie movie in response.results) {
          MovieDao().add(movie, MovieType.popular);
        }
        dataList = await MovieDao().getAllItems(MovieType.popular);
        currentState = PopularListSuccessState(dataList: dataList);
        emit(currentState);
      } on SocketException catch(_){
        emit(PopularInitial());
        dataList = [];
        dataList = await MovieDao().getAllItems(MovieType.popular);
        currentState = PopularListSuccessState(dataList: dataList);
        emit(currentState);
      } catch (e) {
        currentState = PopularListFailState();
        emit(currentState);
      }
    });

    on<UpdatePopularWishlistEvent>((event, emit) async {
      if(currentState is PopularListSuccessState) {
       // List<Movie> dataList = currentState.dataList;
       // var index = dataList.indexOf(event.movie);
       // dataList[index].isFavorite = !dataList[index].isFavorite;
       // dataList.replaceRange(index, index + 1, [event.movie]);
        await MovieDao().updateWishlistStatus((!event.movie.isFavorite)? "true": "false", event.movie.id, event.movie.movieType);
        dataList = await MovieDao().getAllItems(MovieType.popular);
        currentState = currentState.copyWith(dataList: dataList);
        emit(currentState);
      }
    });
  }
}
