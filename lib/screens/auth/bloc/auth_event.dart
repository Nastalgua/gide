part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoadAuth extends AuthEvent {}

class LoginUser extends AuthEvent {
  final String username;
  final String password;

  const LoginUser({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class GoogleLoginUser extends AuthEvent {
  @override
  List<Object> get props => [];
}

class RegisterUser extends AuthEvent {}
