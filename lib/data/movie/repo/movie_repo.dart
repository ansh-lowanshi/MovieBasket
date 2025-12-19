import 'package:moviebasket/core/error/exceptions.dart';
import 'package:moviebasket/data/movie/models/movie.dart';
import 'package:moviebasket/data/services/movie_api_services.dart';

class MovieRepository {
  final MovieApiServices apiServices;
  MovieRepository(this.apiServices);

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final List<dynamic> result = await apiServices.fetchPopularMovies();
      return result.map((json) => MovieModel.fromJson(json)).toList();
    } on NoInternetException {
      rethrow;
    } catch (_) {
      throw Exception('Something went wrong');
    }
  }

  Future<List<MovieModel>> getSearchedMovie(String query) async {
    try {
      final List<dynamic> result = await apiServices.searchMovies(query);
      return result.map((e) => MovieModel.fromJson(e)).toList();
    } on NoInternetException {
      rethrow;
    } catch (_) {
      throw Exception('Something went wrong');
    }
  }
}
