import 'package:bookstore/base/base_bloc.dart';
import 'package:bookstore/base/base_event.dart';
import 'package:bookstore/event/singin_event.dart';
import 'package:bookstore/data/repo/user_repo.dart';
import 'package:bookstore/shared/model/user_data.dart';

class SignInBloc extends BaseBloc {
  final UserRepo _userRepo;

  SignInBloc({required UserRepo userRepo}) : _userRepo = userRepo;

  @override
  void dispatchEvent(BaseEvent event) {
    switch (event.runtimeType) {
      case SignInEvent:
        _signIn(event as SignInEvent);
        break;
      default:
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  _signIn(SignInEvent event) {
    _userRepo.signIn(event.phone, event.password).then(
      (UserData user) {
        print(user.displayName);
        print(user.token);
      },
      onError: (e) {
        print(e);
      },
    );
  }
}
