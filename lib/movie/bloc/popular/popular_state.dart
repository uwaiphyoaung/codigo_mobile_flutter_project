part of 'popular_bloc.dart';

@immutable
abstract class PopularState {}

class PopularInitial extends PopularState {}

class PopularListFailState extends PopularState{}

class PopularListSuccessState extends PopularState{
  List<Movie> dataList;
  PopularListSuccessState({required this.dataList});

  PopularListSuccessState copyWith({
    required List<Movie> dataList,
  }) {
    return PopularListSuccessState(
      dataList: dataList,
    );
  }
}