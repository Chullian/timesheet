part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginUsernameUpdate extends LoginEvent {
  LoginUsernameUpdate(this.username);
  final String username;
  @override
  List<Object> get props => [username];
}

class LoginPasswordUpdate extends LoginEvent {
  LoginPasswordUpdate(this.password);
  final String password;
  @override
  List<Object> get props => [password];
}

class LoginSubmitButtonPressed extends LoginEvent {
  LoginSubmitButtonPressed();
  @override
  List<Object> get props => [];
}
