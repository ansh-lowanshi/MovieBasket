import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebasket/bloc/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void startedApp() async {
    await Future.delayed(Duration(seconds: 2));
    emit(UnAuthenticated());
  }
}
