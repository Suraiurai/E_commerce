part of 'log_in_bloc.dart';

abstract class LogInState extends Equatable {
  const LogInState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends LogInState {}

class LogOutState extends LogInState {}

class SuccessAuthState extends LogInState {}

class LoadingAuthState extends LogInState {}

class FailureAuthState extends LogInState {
  final String error;

  FailureAuthState({ required this.error});
}

