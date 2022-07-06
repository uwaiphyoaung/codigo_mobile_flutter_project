part of 'upcomming_bloc.dart';

@immutable
abstract class UpcommingState {}

class UpcommingInitial extends UpcommingState {}

class ResetState extends UpcommingState{}

class UpcommingListFailState extends UpcommingState{}

class UpcommingListSuccessState extends UpcommingState{
  List<Movie> dataList;
  final bool hasReachedMax;

  UpcommingListSuccessState({required this.dataList, required this.hasReachedMax,});

  UpcommingListSuccessState copyWith({
    List<Movie>? dataList,
    bool? hasReachedMax
  }) {
    return UpcommingListSuccessState(
      dataList: dataList?? this.dataList,
      hasReachedMax: hasReachedMax?? this.hasReachedMax,
    );
  }
}