import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:timesheet/di/injector_provider.dart';
import 'package:timesheet/domain/network_response.dart';
import 'package:timesheet/domain/repositories/auth_repository.dart';

import '../../../components/uiComponents.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final authRepository = getIt.get<AuthRepository>();
  LoginBloc() : super(LoginInitial()) {
    on<LoginUsernameUpdate>((event, emit) {
      state.copy(username: event.username);
    });
    on<LoginPasswordUpdate>((event, emit) {
      state.copy(password: event.password);
    });
    on<LoginSubmitButtonPressed>(_doLogin);
  }

  void _doLogin(
      LoginSubmitButtonPressed event, Emitter<LoginState> emit) async {
    emit(state.copy(isLoading: true));
    var value = await authRepository.doLogin(
        state.username ?? "", state.password ?? "");
    if (value is Success) {
      emit(state.copy(isLoginSuccess: true));
    } else if (value is Failure) {
      emit(state.copy(isLoginSuccess: false, loginError: "error"));
    } else if (value is Error) {
      emit(state.copy(loginError: value.exception.toString()));
    }
  }
}
