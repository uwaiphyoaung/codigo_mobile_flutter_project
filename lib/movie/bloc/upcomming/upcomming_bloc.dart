import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../database/dao/movie_dao.dart';
import '../../../general/api/app_api.dart';
import '../../../general/constants/app_constants.dart';
import '../../../general/entity/movie.dart';
import '../../../general/entity/popular_list_res.dart';

part 'upcomming_event.dart';
part 'upcomming_state.dart';

class UpcommingBloc extends Bloc<UpcommingEvent, UpcommingState> {
  List<Movie> dataList = [];

  var currentState;
  int currentPage = 1;

  UpcommingBloc() : super(UpcommingInitial()) {
    on<UpcommingEvent>((event, emit) {});

    on<FetchUpcomingListEvent>((event, emit) async {
      currentState ??= UpcommingInitial();
      if (!_hasReachedMax(currentState) || event.isReload) {
        if (event.isReload) {
          currentState = UpcommingInitial();
          emit(currentState);
        }
        try {
          if (currentState is UpcommingInitial) {
            currentPage = 1;
            final PopularListRes response = await API()
                .fetchUpcommingList(page: currentPage);
            if (response.results.isNotEmpty) {
              MovieDao().deleteAll(MovieType.upcoming);
              for (Movie movie in response.results) {
                MovieDao().add(movie, MovieType.upcoming);
              }
            }
            dataList = await MovieDao().getAllItems(MovieType.upcoming);

            currentState = UpcommingListSuccessState(
                dataList: dataList,
                hasReachedMax: dataList.length >= response.totalResults
                    ? true
                    : false);

            emit(currentState);
          } else if (currentState is UpcommingListSuccessState) {
            currentPage = currentPage + 1;
            final PopularListRes response = await API()
                .fetchUpcommingList(page: currentPage);
            if (response.results.isEmpty) {
              currentState = currentState.copyWith(hasReachedMax: true);
            } else {
              currentState.dataList += response.results;
              MovieDao().deleteAll(MovieType.upcoming);
              for (Movie movie in currentState.dataList) {
                MovieDao().add(movie, MovieType.upcoming);
              }
              dataList = await MovieDao().getAllItems(MovieType.upcoming);
              currentState = UpcommingListSuccessState(
                dataList: dataList,
                hasReachedMax: false,
              );
            }
            emit(currentState);
          }
        } on SocketException catch(_){
          currentPage = currentPage - 1;
          emit(UpcommingInitial());
          dataList = [];
          dataList = await MovieDao().getAllItems(MovieType.upcoming);
          currentState = UpcommingListSuccessState(hasReachedMax: true, dataList: dataList);
          emit(currentState);
        } catch (e) {
          currentPage = currentPage - 1;
          currentState = UpcommingListFailState();
          emit(currentState);
        }
      }
    });

    on<UpdateUpcomingWishlistEvent>((event, emit) async {
      if(currentState is UpcommingListSuccessState) {
        await MovieDao().updateWishlistStatus((!event.movie.isFavorite)? "true": "false", event.movie.id, MovieType.upcoming.name);
        dataList = await MovieDao().getAllItems(MovieType.upcoming);
        currentState = currentState.copyWith(dataList: dataList);
        emit(currentState);
      }
    });


  }

  bool _hasReachedMax(UpcommingState state) {
    print("");
    bool isReachedMax = state is UpcommingListSuccessState && state.hasReachedMax;
    return isReachedMax;
  }
}