import 'package:timesheet/domain/network_response.dart';

abstract class AuthRepository {
  Future<NetworkResponse> doLogin(String username, String password);
  Future<NetworkResponse> doRegister(
      String username, String email, String password);
}
