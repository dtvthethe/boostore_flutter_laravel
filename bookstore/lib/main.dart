import 'package:bookstore/module/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/module/signin/signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SigninPage(),
        '/sign-up': (context) => SignUpPage(),
      },
    );
  }
}
