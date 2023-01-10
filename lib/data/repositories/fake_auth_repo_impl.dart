import '../../domain/network_response.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/responses/base_response.dart';
import '../../domain/responses/login_response.dart';

class FakeAuthRepoImpl implements AuthRepository {
  @override
  Future<NetworkResponse> doLogin(String username, String password) async {
    await Future.delayed(Duration(seconds: 2));
    var responseBody = LoginResponse(
        id: 6,
        email: "noushadchullian@gmail.com",
        name: "Noushad Chullian",
        token: "123erfgbvcdsq23rtghbvcdsertgbvcxdfgbvcdertghnbvcxdfgh");
    var response = BaseResponse<LoginResponse>(
        status: true, message: "Login Success", data: responseBody);
    return Success(successResponse: response);
  }

  @override
  Future<NetworkResponse> doRegister(
      String username, String email, String password) {
    // TODO: implement doRegister
    throw UnimplementedError();
  }
}
