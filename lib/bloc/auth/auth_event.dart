import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class LoginRequest extends AuthEvent{
  final String email;
  final String password;

  LoginRequest(this.email,this.password);

  @override
  List<Object?> get props => [email,password];
}

class SignupRequest extends AuthEvent{
  final String email;
  final String password;

  SignupRequest(this.email,this.password);

  @override
  List<Object?> get props => [email,password];
}

class LogoutRequest extends AuthEvent{}