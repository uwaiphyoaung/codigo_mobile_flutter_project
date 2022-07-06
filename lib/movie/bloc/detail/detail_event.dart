part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class LoadMovieDetail extends DetailEvent{
  int id;

  LoadMovieDetail(this.id);
}

