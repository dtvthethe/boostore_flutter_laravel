import 'package:dio/dio.dart';

class BookClient {
  static final BaseOptions _options = BaseOptions(
    baseUrl: 'http://127.0.0.1:8000/api/',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  static Dio _dio = Dio(_options);

  BookClient._internal() {
    // Print request/response log automaticlly.
    _dio.interceptors.add(LogInterceptor(responseBody: false));
  }

  static BookClient instance = BookClient._internal();
  Dio get dio => _dio;
}
