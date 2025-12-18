import 'package:moviebasket/data/movie/models/movie.dart';
import 'package:moviebasket/data/services/movie_api_services.dart';

class MovieRepository {
  final MovieApiServices apiServices;
  MovieRepository(this.apiServices);

  Future<List<MovieModel>> getPopularMovies() async {
    final List<dynamic> result = await apiServices.fetchPopularMovies();
    return result.map((json) => MovieModel.fromJson(json)).toList();
  }
}
