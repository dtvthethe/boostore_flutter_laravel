import 'package:bookstore/base/base_event.dart';
import 'package:bookstore/shared/model/user_data.dart';

class SignInSuccessEvent extends BaseEvent {
  final UserData user;

  SignInSuccessEvent({required this.user});
}
