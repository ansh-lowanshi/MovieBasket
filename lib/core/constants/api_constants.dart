import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String apiKey = dotenv.env['TMDB_API_KEY'] ?? 'NO_API_KEY';
  static String baseUrl = 'https://api.themoviedb.org/3';

  static String popularMovies = '$baseUrl/movie/popular?api_key=$apiKey';

  static String searchMovies(String query) =>
      '$baseUrl/search/movie?api_key=$apiKey&query=$query';
}
