part of 'popular_bloc.dart';

@immutable
abstract class PopularEvent {}

class FetchPopularListEvent extends PopularEvent{
}

class UpdatePopularWishlistEvent extends PopularEvent {
  Movie movie;
  UpdatePopularWishlistEvent(this.movie);
}