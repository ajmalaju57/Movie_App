import 'dart:convert';

class ApiResponse<T> {
  bool status;
  T data;

  ApiResponse(
      {required this.status, required this.data});

  factory ApiResponse.fromJson(int status, String body) {
    final map = json.decode(body);
    return ApiResponse<T>(
      status: status == 200 || status == 201,
      data: map,
    );
  }
}
