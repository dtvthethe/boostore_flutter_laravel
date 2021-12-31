import 'package:bookstore/shared/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField {
  static TextField phoneTextBox(
    TextEditingController txtController, {
    void onChange<T>(T value)?,
    String? error,
  }) {
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
        errorText: error,
      ),
      keyboardType: TextInputType.phone,
      cursorColor: Color(Colors.black.value),
      controller: txtController,
      onChanged: (value) {
        if (onChange != null) {
          onChange(value);
        }
      },
    );
  }

  static TextField passswordTextBox(
    TextEditingController txtController, {
    void onChange<T>(T value)?,
    String? error,
  }) {
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
        errorText: error,
      ),
      cursorColor: Color(Colors.black.value),
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: txtController,
      onChanged: (value) {
        if (onChange != null) {
          onChange(value);
        }
      },
    );
  }
}
