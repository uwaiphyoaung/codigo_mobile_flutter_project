part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailError extends DetailState {
  String type;

  DetailError(this.type);
}

class DetailDataState extends DetailState {
  MovieDetailEntity data;

  DetailDataState(this.data);
}
class ResetState extends DetailState{}

