import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchPopularMovies extends MovieEvent {}

class SearchMovie extends MovieEvent {
  final String query;
  SearchMovie(this.query);
  @override
  List<Object?> get props => [query];
}
