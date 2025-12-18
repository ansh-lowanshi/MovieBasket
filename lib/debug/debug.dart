import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TmdbPopularApiKeyDebugScreen extends StatefulWidget {
  const TmdbPopularApiKeyDebugScreen({super.key});

  @override
  State<TmdbPopularApiKeyDebugScreen> createState() =>
      _TmdbPopularApiKeyDebugScreenState();
}

class _TmdbPopularApiKeyDebugScreenState
    extends State<TmdbPopularApiKeyDebugScreen> {
  bool isLoading = true;
  String error = '';
  List<dynamic> movies = [];

  // 🔑 TMDB API KEY (v3)
  static const String apiKey = '790cb1d3367cd9ca2d4aad6fc3952856';

  @override
  void initState() {
    super.initState();
    fetchPopularMovies();
  }

  Future<void> fetchPopularMovies() async {
    try {
      final uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular'
        '?api_key=$apiKey'
        '&language=en-US'
        '&page=1',
      );

      final response = await http.get(
        uri,
        headers: {
          'accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          movies = data['results'];
          isLoading = false;
        });
      } else {
        setState(() {
          error = 'Status code: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB Popular (API Key Debug)'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error.isNotEmpty
              ? Center(
                  child: Text(
                    error,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return ListTile(
                      title: Text(movie['title'] ?? 'No title'),
                      subtitle: Text(
                        'Release: ${movie['release_date'] ?? 'N/A'}',
                      ),
                      trailing: Text(
                        movie['vote_average'] != null
                            ? movie['vote_average'].toString()
                            : 'N/A',
                      ),
                    );
                  },
                ),
    );
  }
}
