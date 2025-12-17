import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebasket/common/helper/navigation/app_navigation.dart';
import 'package:moviebasket/core/theme/app_colors.dart';
import 'package:moviebasket/presentation/auth/screens/login_screen.dart';
import 'package:moviebasket/presentation/home/screens/home_screen.dart';
import 'package:moviebasket/presentation/splash/bloc/splash_cubit.dart';
import 'package:moviebasket/presentation/splash/bloc/splash_state.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            AppNavigation.pushReplacement(context, LoginScreen());
          }
          if (state is Authenticated) {
            AppNavigation.pushReplacement(context, HomeScreen());
          }
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.background,
                AppColors.surface,
                AppColors.accent,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MovieBasket',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 15),
              Image.asset('assets/icon/app_icon.png', height: 200, width: 200),
              SizedBox(height: 25),
              CircularProgressIndicator(color: AppColors.textPrimary),
            ],
          ),
        ),
      ),
    );
  }
}

Route<void> _createRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
