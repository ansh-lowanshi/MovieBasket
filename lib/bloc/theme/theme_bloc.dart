import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    on<SetLightTheme>((event, emit) {
      emit(ThemeMode.light);
    });

    on<SetDarkTheme>((event, emit) {
      emit(ThemeMode.dark);
    });

    on<SetSystemTheme>((event, emit) {
      emit(ThemeMode.system);
    });

    on<ToggleTheme>((event, emit) {
      emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
    });
  }
}
