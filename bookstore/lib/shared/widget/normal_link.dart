import 'package:flutter/material.dart';
import 'package:bookstore/shared/app_color.dart';

class NormalLink extends StatelessWidget {
  final VoidCallback tap;
  final String title;

  NormalLink({required this.tap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.blue,
        ),
      ),
    );
  }
}
