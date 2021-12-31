import 'package:dio/dio.dart';
import 'package:bookstore/network/book_client.dart';

class UserService {
  Future<Response> userLogin(String phone, String password) {
    return BookClient.instance.dio.post(
      'user/login',
      data: {
        'phone': phone,
        'password': password,
        'device_name': 'TheiPhone',
      },
    );
  }
}
