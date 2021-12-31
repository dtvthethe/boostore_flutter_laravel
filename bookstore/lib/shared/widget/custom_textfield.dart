import 'package:bookstore/shared/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField {
  static TextField phoneTextBox(TextEditingController txtController) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.phone,
          color: AppColor.blue,
        ),
        hintText: '(+84) 00 000 0000',
        labelText: 'Phone',
        labelStyle: TextStyle(
          color: AppColor.blue,
        ),
      ),
      keyboardType: TextInputType.phone,
      cursorColor: Color(Colors.black.value),
      controller: txtController,
    );
  }

  static TextField passswordTextBox(TextEditingController txtController) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          color: AppColor.blue,
        ),
        hintText: 'Password',
        labelText: 'Password',
        labelStyle: TextStyle(
          color: AppColor.blue,
        ),
      ),
      cursorColor: Color(Colors.black.value),
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: txtController,
    );
  }
}
