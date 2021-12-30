import 'package:bookstore/base/base_event.dart';

class SignInEvent extends BaseEvent {
  String phone;
  String password;

  SignInEvent({required this.phone, required this.password});
}
