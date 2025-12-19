import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebasket/bloc/auth/auth_bloc.dart';
import 'package:moviebasket/bloc/auth/auth_event.dart';
import 'package:moviebasket/bloc/auth/auth_state.dart';
import 'package:moviebasket/bloc/movie/movie_bloc.dart';
import 'package:moviebasket/bloc/movie/movie_event.dart';
import 'package:moviebasket/bloc/movie/movie_state.dart';
import 'package:moviebasket/bloc/theme/theme_bloc.dart';
import 'package:moviebasket/bloc/theme/theme_event.dart';
import 'package:moviebasket/common/helper/navigation/app_navigation.dart';
import 'package:moviebasket/core/theme/app_colors.dart';
import 'package:moviebasket/data/movie/models/movie.dart';
import 'package:moviebasket/presentation/auth/screens/login_screen.dart';
import 'package:moviebasket/presentation/home/screens/search_screen.dart';
import 'package:moviebasket/presentation/movie/movie_grid_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(FetchPopularMovies());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticted) {
          AppNavigation.pushReplacement(context, LoginScreen());
        }
      },
      child: Scaffold(
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
            IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(LogoutRequest());
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is MovieLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<MovieBloc>().add(FetchPopularMovies());
                },
                child: GridView.builder(
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
                ),
              );
            }

            if (state is MovieError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppNavigation.push(context, SearchScreen());
          },
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}
