part of 'upcomming_bloc.dart';

@immutable
abstract class UpcommingEvent {}

class FetchUpcomingListEvent extends UpcommingEvent{
  bool isReload;

  FetchUpcomingListEvent(this.isReload);
}

class UpdateUpcomingWishlistEvent extends UpcommingEvent {
  Movie movie;
  UpdateUpcomingWishlistEvent(this.movie);
}