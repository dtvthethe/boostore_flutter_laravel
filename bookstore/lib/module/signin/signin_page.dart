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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: CustomTextField.phoneTextBox(txtPhoneController),
              margin: EdgeInsets.only(bottom: 16),
            ),
            Container(
              child: CustomTextField.passswordTextBox(txtPassController),
              margin: EdgeInsets.only(bottom: 30),
            ),
            Container(
              child: Consumer<SignInBloc>(
                builder: (context, value, child) => NormalButton(
                  onPress: () {
                    value.eventSink.add(SignInEvent(
                      phone: txtPhoneController.text,
                      password: txtPassController.text,
                    ));
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: NormalLink(
                tap: () {},
                title: 'Đăng kí tài khoản',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
