part of 'log_in_bloc.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends LogInEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class LogOutEvent extends LogInEvent {}

class CheckLoginEvent extends LogInEvent {}

