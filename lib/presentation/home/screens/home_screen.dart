import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebasket/bloc/auth/auth_bloc.dart';
import 'package:moviebasket/bloc/auth/auth_event.dart';
import 'package:moviebasket/bloc/auth/auth_state.dart';
import 'package:moviebasket/bloc/theme/theme_bloc.dart';
import 'package:moviebasket/bloc/theme/theme_event.dart';
import 'package:moviebasket/common/helper/navigation/app_navigation.dart';
import 'package:moviebasket/core/theme/app_colors.dart';
import 'package:moviebasket/presentation/auth/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      ),
    );
  }
}
