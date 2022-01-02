import 'package:bookstore/base/base_event.dart';

class SignInFailEvent extends BaseEvent {
  final String message;

  SignInFailEvent({required this.message});
}
