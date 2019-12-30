import 'package:dio/dio.dart';

class AuthManager {
  final String _endpoint = "http://localhost:3300/auth";
  final Dio _dio = Dio();

  Future<void> signIn() async {
    try {
      Response response = await _dio.get(_endpoint + '/users');
      print(response.data.toString());
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
