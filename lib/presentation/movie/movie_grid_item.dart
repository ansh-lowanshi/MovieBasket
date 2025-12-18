import 'package:flutter/material.dart';
import 'package:moviebasket/common/helper/navigation/app_navigation.dart';
import 'package:moviebasket/core/theme/app_colors.dart';
import 'package:moviebasket/data/movie/models/movie.dart';
import 'package:moviebasket/presentation/movie/movie_detail.dart';

class MovieGridItem extends StatelessWidget {
  const MovieGridItem({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigation.push(context, MovieDetailScreen(movie: movie));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: movie.posterPath != null
                  ? Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      width: double.infinity,
                    )
                  : Container(
                      color: Colors.grey,
                      child: Icon(Icons.movie, size: 50),
                    ),
            ),

            const SizedBox(height: 5),

            Text(
              movie.title ?? 'No title',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),

            const SizedBox(height: 5),

            Row(
              children: [
                SizedBox(width: 10),
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 5),
                Text(
                  movie.voteAverage != null
                      ? movie.voteAverage!.toStringAsFixed(1)
                      : 'N/A',
                ),
                Expanded(child: Text('')),
                Text(
                  movie.voteCount != null ? movie.voteCount!.toString() : 'N/A',
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
