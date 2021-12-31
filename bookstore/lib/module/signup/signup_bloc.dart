import 'dart:async';

import 'package:bookstore/base/base_bloc.dart';
import 'package:bookstore/base/base_event.dart';
import 'package:bookstore/data/repo/user_repo.dart';
import 'package:bookstore/event/signup_event.dart';
import 'package:bookstore/shared/validation.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc extends BaseBloc {
  late UserRepo _userRepo;
  final BehaviorSubject<String> _txtNameSubject = BehaviorSubject<String>();
  final BehaviorSubject<String> _txtPhoneSubject = BehaviorSubject<String>();
  final BehaviorSubject<String> _txtPassSubject = BehaviorSubject<String>();
  final BehaviorSubject<bool> _btnSignUpSubject = BehaviorSubject<bool>();

  SignUpBloc({required UserRepo userRepo}) {
    _userRepo = userRepo;
    _tranformBtnSignUP();
  }

  Sink<String?> get txtNameSubjectSink => _txtNameSubject.sink;
  Stream<String?> get txtNameSubjectStream =>
      _txtNameSubject.stream.transform<String?>(_txtNameSubjectTransform);

  Sink<String?> get txtPhoneSubjectSink => _txtPhoneSubject.sink;
  Stream<String?> get txtPhoneSubjectStream =>
      _txtPhoneSubject.stream.transform(_txtPhoneTransform);

  Sink<String?> get txtPassSubjectSink => _txtPassSubject.sink;
  Stream<String?> get txtPassSubjectStream =>
      _txtPassSubject.stream.transform(_txtPassTransform);

  Sink<bool> get btnSignUpSubjectSink => _btnSignUpSubject.sink;
  Stream<bool> get btnSignUpSubjectStream => _btnSignUpSubject.stream;

  final StreamTransformer<String, String?> _txtNameSubjectTransform =
      StreamTransformer<String, String?>.fromHandlers(
    handleData: (data, sink) {
      if (Validation.isDisaplayNameValid(data)) {
        sink.add(null);
        return;
      }

      sink.add('Display name is invalid');
    },
  );

  final StreamTransformer<String, String?> _txtPhoneTransform =
      StreamTransformer<String, String?>.fromHandlers(
    handleData: (data, sink) {
      if (Validation.isPhone(data)) {
        sink.add(null);
        return;
      }
      sink.add('Phone is invalid');
    },
  );

  final StreamTransformer<String, String?> _txtPassTransform =
      StreamTransformer<String, String?>.fromHandlers(
    handleData: (data, sink) {
      if (Validation.isPassValid(data)) {
        sink.add(null);
        return;
      }
      sink.add('Password is invalid');
    },
  );

  void _tranformBtnSignUP() {
    CombineLatestStream.combine3<String, String, String, bool>(
        _txtNameSubject, _txtPhoneSubject, _txtPassSubject, (a, b, c) {
      return Validation.isDisaplayNameValid(a) &&
          Validation.isPhone(b) &&
          Validation.isPassValid(c);
    }).listen((value) {
      _btnSignUpSubject.sink.add(value);
    });
  }

  @override
  void dispatchEvent(BaseEvent event) {
    switch (event.runtimeType) {
      case SignUpEvent:
        SignUpEvent signUpEvent = event as SignUpEvent;
        _userRepo
            .signUp(signUpEvent.displayName, signUpEvent.password,
                signUpEvent.phone)
            .then(
          (value) {
            print('Dang ki thanh cong phone =  ${value.phone}');
          },
          onError: (e) {
            print(e);
          },
        );
        break;
      default:
    }
  }

  @override
  void dispose() {
    _txtNameSubject.close();
    _txtPhoneSubject.close();
    _txtPassSubject.close();
    _btnSignUpSubject.close();
    super.dispose();
  }
}
