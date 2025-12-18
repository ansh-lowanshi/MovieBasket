import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String apiKey = dotenv.env['TMDB_API_KEY'] ?? 'NO_API_KEY';
  static String baseUrl = 'https://api.themoviedb.org/3';

  static String popularMovies = '$baseUrl/movie/popular?api_key=$apiKey';

  static const String tvMazeBaseUrl = 'https://api.tvmaze.com';

  static String tvMazeShows({int page =0}) => '$tvMazeBaseUrl/shows?page=$page';

  static String searchShow(String query) => '$tvMazeBaseUrl/search/shows?q=$query';
}
