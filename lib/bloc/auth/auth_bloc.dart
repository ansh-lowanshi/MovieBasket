import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebasket/bloc/auth/auth_event.dart';
import 'package:moviebasket/bloc/auth/auth_state.dart';
import 'package:moviebasket/bloc/splash/splash_state.dart';
import 'package:moviebasket/data/services/local_storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      final loggedIn = await LocalStorage.isLoggedIn();
      if (loggedIn) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnauthenticted());
      }
    });

    on<LoginRequest>((event, emit) async {
      emit(Authloading());

      final success = await LocalStorage.loginUser(event.email, event.password);

      if(success){
        emit(AuthAuthenticated());
      }
      else {
        emit(AuthUnauthenticted());
      }
    });

    on<SignupRequest>((event,emit) async {
      emit(Authloading());
      await LocalStorage.saveUser(event.email, event.password);
      emit(AuthAuthenticated());
    });
  }
}
