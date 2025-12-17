import 'package:flutter/material.dart';
import 'package:moviebasket/core/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebasket/presentation/splash/bloc/splash_cubit.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_bloc.dart';
import 'package:moviebasket/presentation/splash/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => SplashCubit()..startedApp()),
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
