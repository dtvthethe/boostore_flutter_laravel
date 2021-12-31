import 'package:bookstore/shared/app_color.dart';
import 'package:bookstore/shared/style/btn_style.dart';
import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  late VoidCallback? onPress;

  NormalButton({this.onPress});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      // TODO: remove ButtonTheme dc ko
      minWidth: 200,
      height: 45,
      child: ElevatedButton(
        child: Text(
          'Sign In',
          style: BtnStyle.normal(),
        ),
        onPressed:
            onPress, // TODO: vi sao ko dung () => vi day la khai bao ko phai define de chay event
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          primary: AppColor.yellow,
        ),
      ),
    );
  }
}
