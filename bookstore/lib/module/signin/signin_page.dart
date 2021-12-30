import 'package:bookstore/shared/widget/normal_link.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/base/base_widget.dart';
import 'package:bookstore/shared/widget/normal_button.dart';
import 'package:bookstore/shared/widget/custom_textfield.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: 'Sign In',
      child: LoginWidget(),
      actions: [],
      bloc: [],
      di: [],
    );
  }
}

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: CustomTextField.phoneTextBox(),
            margin: EdgeInsets.only(bottom: 16),
          ),
          Container(
            child: CustomTextField.passswordTextBox(),
            margin: EdgeInsets.only(bottom: 30),
          ),
          NormalButton(onPress: () {}),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: NormalLink(
              tap: () {},
              title: 'Đăng kí tài khoản',
            ),
          ),
        ],
      ),
    );
  }
}
