import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebasket/bloc/auth/auth_event.dart';
import 'package:moviebasket/bloc/auth/auth_state.dart';
import 'package:moviebasket/bloc/splash/splash_state.dart';
import 'package:moviebasket/data/services/local_storage.dart';

enum LoginResult { success, wrongCredentials, notRegistered }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      final loggedIn = await LocalStorage.shouldAutoLogin();
      if (loggedIn) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnauthenticted());
      }
    });

    on<LoginRequest>((event, emit) async {
      emit(Authloading());

      final result = await LocalStorage.loginUser(event.email, event.password, event.rememberMe);
      switch (result) {
        case LoginResult.success:
          emit(AuthAuthenticated());
          break;
        case LoginResult.notRegistered:
          emit(AuthError('User not Registered'));
          break;
        case LoginResult.wrongCredentials:
          emit(AuthError('Wrong Credentials'));
          break;
      }
    });

    on<SignupRequest>((event, emit) async {
      emit(Authloading());
      await LocalStorage.saveUser(event.email, event.password, event.rememberMe);
      emit(AuthAuthenticated());
    });

    on<LogoutRequest>((event, emit) async {
      await LocalStorage.logout();
      emit(AuthUnauthenticted());
    });
  }
}
