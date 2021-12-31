import 'package:bookstore/base/base_event.dart';

class SignUpEvent extends BaseEvent {
  String phone;
  String password;
  String displayName;
  String? avatar;

  SignUpEvent({
    required this.phone,
    required this.password,
    required this.displayName,
    this.avatar,
  });
}
