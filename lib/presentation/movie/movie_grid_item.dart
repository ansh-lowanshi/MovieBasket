import 'package:flutter/material.dart';
import 'package:moviebasket/data/movie/models/movie.dart';

class MovieGridItem extends StatelessWidget {
  const MovieGridItem({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all()),
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
            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),
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
    );
  }
}
