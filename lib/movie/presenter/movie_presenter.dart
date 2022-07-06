import 'package:codigo_project/movie/bloc/detail/detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/constants/app_constants.dart';
import '../../general/entity/movie.dart';
import '../bloc/popular/popular_bloc.dart';
import '../bloc/upcomming/upcomming_bloc.dart';

class MoviePresenter {
  void fetchPopularList(BuildContext context) =>
      BlocProvider.of<PopularBloc>(context).add(FetchPopularListEvent());

  void fetchUpcomingList(BuildContext context, bool isReload) =>
      BlocProvider.of<UpcommingBloc>(context).add(FetchUpcomingListEvent(isReload));

  void findMovieDetail(BuildContext context, int id) =>
      BlocProvider.of<DetailBloc>(context).add(LoadMovieDetail(id));

  void updateWishlistStatus(BuildContext context, Movie movie) {
    if (movie.movieType == MovieType.popular.name) {
      BlocProvider.of<PopularBloc>(context)
          .add(UpdatePopularWishlistEvent(movie));
    } else if (movie.movieType == MovieType.upcoming.name) {
      BlocProvider.of<UpcommingBloc>(context)
          .add(UpdateUpcomingWishlistEvent(movie));
    }
  }
}


