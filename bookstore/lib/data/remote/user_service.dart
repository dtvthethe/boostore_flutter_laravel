import 'dart:async';
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

  Future<Response> signUp(String name, String phone, String pass) {
    return BookClient.instance.dio.post(
      'user/register',
      data: {
        'phone': phone,
        'password': pass,
        'display_name': name,
      },
    );
  }
}
