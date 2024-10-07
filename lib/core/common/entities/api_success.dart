abstract class ApiResponse<T> {
  final int statusCode;
  final String message;
  final T? result;

  ApiResponse({
    required this.statusCode,
    required this.message,
    this.result,
  });

  bool get isSuccess => statusCode >= 200 && statusCode < 300;

  @override
  String toString() {
    return 'Status Code: $statusCode, Message: $message, Result: $result';
  }
}

class ApiSuccess extends ApiResponse {
  ApiSuccess({required super.statusCode, required super.message, super.result});
}

class ApiFaliure extends ApiResponse {
  ApiFaliure({required super.statusCode, required super.message});
}
