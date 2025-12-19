import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebasket/bloc/theme/theme_bloc.dart';
import 'package:moviebasket/bloc/theme/theme_event.dart';
import 'package:moviebasket/core/theme/app_colors.dart';
import 'package:moviebasket/data/movie/models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MovieBasket',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleTheme());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              child: movie.posterPath != null
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                          fit: BoxFit.cover,
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsetsGeometry.fromLTRB(
                            0,
                            8,
                            0,
                            8,
                          ),
                          child: Align(
                            alignment: AlignmentGeometry.center,
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(color: Colors.grey, child: Icon(Icons.movie)),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    movie.title ?? "No title",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(fontSize: 28),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 5),
                      Text(
                        movie.voteAverage != null
                            ? movie.voteAverage!.toStringAsFixed(1)
                            : 'N/A',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '/10',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(child: Text('')),
                      Icon(Icons.calendar_month_outlined, color: Colors.blue),
                      SizedBox(width: 3),
                      Text(
                        movie.releaseDate != null
                            ? DateFormat(
                                'dd MMM yyyy',
                              ).format(movie.releaseDate!).toString()
                            : 'N/A',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 10),

                  Text(
                    'Overview',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(fontSize: 20),
                  ),

                  SizedBox(height: 5),

                  Text(
                    movie.overview ?? 'No description available',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),

                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
