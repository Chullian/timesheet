part of 'login_bloc.dart';

class LoginState extends Equatable {
  String? _username;
  String? _password;
  bool? _isLoading;
  bool? _isLoginSuccess;
  String? _loginError;
  UiComponents? _uiComponents;

  LoginState(
      {String? username,
      String? password,
      bool? isLoading,
      bool? isLoginSuccess,
      String? loginError,
      UiComponents? uiComponents}) {
    if (username != null) {
      this._username = username;
    }
    if (password != null) {
      this._password = password;
    }
    if (isLoading != null) {
      this._isLoading = isLoading;
    }
    if (isLoginSuccess != null) {
      this._isLoginSuccess = isLoginSuccess;
    }
    if (loginError != null) {
      this._loginError = loginError;
    }
    if (uiComponents != null) {
      this._uiComponents = uiComponents;
    }
  }

  String? get username => _username;
  set username(String? username) => _username = username;
  String? get password => _password;
  set password(String? password) => _password = password;
  bool? get isLoading => _isLoading;
  set isLoading(bool? isLoading) => _isLoading = isLoading;
  bool? get isLoginSuccess => _isLoginSuccess;
  set isLoginSuccess(bool? isLoginSuccess) => _isLoginSuccess = isLoginSuccess;
  String? get loginError => _loginError;
  set loginError(String? loginError) => _loginError = loginError;
  UiComponents? get uiComponents => _uiComponents;
  set uiComponents(UiComponents? loginError) => _uiComponents = uiComponents;

  LoginState copy({
    String? username,
    String? password,
    bool? isLoading,
    bool? isLoginSuccess,
    String? loginError,
    UiComponents? uiComponents,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
      loginError: loginError ?? this.loginError,
      uiComponents: uiComponents ?? this.uiComponents,
    );
  }

  @override
  List<Object?> get props =>
      [username, password, isLoading, isLoginSuccess, loginError, uiComponents];
}

class LoginInitial extends LoginState {}
