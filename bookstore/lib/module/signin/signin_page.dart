import 'package:bookstore/data/remote/user_service.dart';
import 'package:bookstore/data/repo/user_repo.dart';
import 'package:bookstore/event/singin_event.dart';
import 'package:bookstore/module/signin/signin_bloc.dart';
import 'package:bookstore/shared/widget/normal_link.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/base/base_widget.dart';
import 'package:bookstore/shared/widget/normal_button.dart';
import 'package:bookstore/shared/widget/custom_textfield.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: 'Sign In',
      child: LoginWidget(),
      actions: [],
      bloc: [],
      di: [
        Provider.value(value: UserService()),
        ProxyProvider<UserService, UserRepo>(
          update: (context, value, previous) => UserRepo(userService: value),
        ),
      ],
    );
  }
}

class LoginWidget extends StatelessWidget {
  final TextEditingController txtPhoneController = TextEditingController();
  final TextEditingController txtPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Provider<SignInBloc>(
      create: (context22222) =>
          SignInBloc(userRepo: Provider.of<UserRepo>(context)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<SignInBloc>(
          builder: (context, signInBloc, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: StreamProvider<String?>.value(
                  value: signInBloc.txtPhoneSubjectStream,
                  initialData: null,
                  builder: (context, child) => Consumer<String?>(
                    builder: (context, msg, child) =>
                        CustomTextField.phoneTextBox(
                      txtPhoneController,
                      onChange: <String>(value) {
                        // Vi txtPhoneSubjectSink laf Stream<String> nen add vao String se xu li dc
                        signInBloc.txtPhoneSubjectSink.add(value.toString());
                      },
                      error: msg,
                    ),
                  ),
                ),
                margin: EdgeInsets.only(bottom: 16),
              ),
              Container(
                child: StreamProvider<String?>.value(
                  value: signInBloc.txtPasswordSubjectStream,
                  initialData: null,
                  builder: (context, child) => Consumer<String?>(
                    builder: (context, msg, child) =>
                        CustomTextField.passswordTextBox(
                      txtPassController,
                      onChange: <String>(value) {
                        // Vi txtPhoneSubjectSink laf Stream<String> nen add vao String se xu li dc
                        signInBloc.txtPasswordSubjectSink.add(value.toString());
                      },
                      error: msg,
                    ),
                  ),
                ),
                margin: EdgeInsets.only(bottom: 30),
              ),
              Container(
                child: StreamProvider.value(
                  value: signInBloc.btnSignInSubjectStream,
                  initialData: false,
                  builder: (context, child) => Consumer<bool>(
                    builder: (context, value, child) => NormalButton(
                      onPress: value
                          ? () {
                              signInBloc.eventSink.add(
                                SignInEvent(
                                  phone: txtPhoneController.text,
                                  password: txtPassController.text,
                                ),
                              );
                            }
                          : null,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: NormalLink(
                  tap: () {
                    Navigator.pushNamed(context, '/sign-up');
                  },
                  title: 'Đăng kí tài khoản',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
