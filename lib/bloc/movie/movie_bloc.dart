import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebasket/bloc/movie/movie_event.dart';
import 'package:moviebasket/bloc/movie/movie_state.dart';
import 'package:moviebasket/data/movie/repo/movie_repo.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;

  MovieBloc(this.repository) : super(MovieInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(MovieLoading());
      try {
        final movies = await repository.getPopularMovies();
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    });

    on<SearchMovie>((event, emit) async {
      if(event.query.isEmpty){
        emit(MovieInitial());
        return;
      }
      emit(MovieLoading());
      try {
        final movies = await repository.getSearchedMovie(event.query);
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    });
  }
}
