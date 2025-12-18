import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moviebasket/bloc/auth/auth_bloc.dart';
import 'package:moviebasket/bloc/auth/auth_event.dart';
import 'package:moviebasket/bloc/movie/movie_bloc.dart';
import 'package:moviebasket/core/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebasket/data/movie/repo/movie_repo.dart';
import 'package:moviebasket/data/services/movie_api_services.dart';
import 'bloc/theme/theme_bloc.dart';
import 'package:moviebasket/presentation/splash/screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => AuthBloc()..add(AppStarted())),
        BlocProvider(create: (_) => MovieBloc(MovieRepository(MovieApiServices()))),
      ],

      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
