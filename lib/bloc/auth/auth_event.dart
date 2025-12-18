import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class LoginRequest extends AuthEvent{
  final String email;
  final String password;
  final bool rememberMe;

  LoginRequest(this.email,this.password,this.rememberMe);

  @override
  List<Object?> get props => [email,password];
}

class SignupRequest extends AuthEvent{
  final String email;
  final String password;
  final bool rememberMe;

  SignupRequest(this.email,this.password,this.rememberMe);

  @override
  List<Object?> get props => [email,password];
}

class LogoutRequest extends AuthEvent{}