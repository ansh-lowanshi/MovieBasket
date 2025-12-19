import 'dart:convert';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:moviebasket/core/constants/api_constants.dart';
import 'package:moviebasket/core/error/exceptions.dart';
import 'package:moviebasket/data/movie/models/movie.dart';

class MovieApiServices {
  Future<List<dynamic>> fetchPopularMovies() async {

    try{
      final response = await http.get(Uri.parse(ApiConstants.popularMovies));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      return List<dynamic>.from(data['results']);
    } else {
      throw Exception('Failed to load Movies');
    }
    } on SocketException {
      throw NoInternetException();
    }

  }

  Future<List<dynamic>> searchMovies(String query) async {
    final response = await http.get(Uri.parse(ApiConstants.searchMovies(query)));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return List<dynamic>.from(data['results']);
    } else {
      throw Exception('Failed to lead Movies');
    }
  }
}
