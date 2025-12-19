import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebasket/bloc/movie/movie_bloc.dart';
import 'package:moviebasket/bloc/movie/movie_event.dart';
import 'package:moviebasket/bloc/movie/movie_state.dart';
import 'package:moviebasket/bloc/theme/theme_bloc.dart';
import 'package:moviebasket/bloc/theme/theme_event.dart';
import 'package:moviebasket/core/theme/app_colors.dart';
import 'package:moviebasket/presentation/movie/movie_grid_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search ...',
                labelStyle: TextStyle(color: AppColors.textSecondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                    });
                  },
                  icon: Icon(Icons.close),
                ),
              ),
              keyboardType: TextInputType.name,
              onChanged: (value) {
                context.read<MovieBloc>().add(SearchMovie(value));
              },
              autofocus: true,
            ),
          ),
          Expanded(
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is MovieLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is MovieInitial) {
                  return Center(child: Text("Start typing to search"));
                }
                if (state is MovieError) {
                  return Center(child: Text(state.message));
                }
                if (state is MovieLoaded) {
                  return GridView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      final movie = state.movies[index];
                      return MovieGridItem(movie: movie);
                    },
                  );
                } else {
                  return Text('Some error occured');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
