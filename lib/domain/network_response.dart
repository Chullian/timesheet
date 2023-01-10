abstract class NetworkResponse {}

class Success<T> extends NetworkResponse {
  final T successResponse;
  Success({required this.successResponse});
}

class Failure<T> extends NetworkResponse {
  final T failureResponse;
  Failure({required this.failureResponse});
}

class Error extends NetworkResponse {
  Exception exception;
  Error({required this.exception});
}
