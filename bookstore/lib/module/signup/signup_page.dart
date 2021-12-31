import 'package:bookstore/base/base_widget.dart';
import 'package:bookstore/data/remote/user_service.dart';
import 'package:bookstore/data/repo/user_repo.dart';
import 'package:bookstore/event/signup_event.dart';
import 'package:bookstore/module/signup/signup_bloc.dart';
import 'package:bookstore/shared/widget/custom_textfield.dart';
import 'package:bookstore/shared/widget/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: 'SignUp',
      child: SignUpWidget(),
      bloc: [],
      di: [
        Provider<UserService>.value(value: UserService()),
        ProxyProvider<UserService, UserRepo>(
          update: (context, value, previous) => UserRepo(
            userService: value,
          ),
        ),
      ],
      actions: [],
    );
  }
}

class SignUpWidget extends StatelessWidget {
  TextEditingController _txtNameController = TextEditingController();
  TextEditingController _txtPhoneController = TextEditingController();
  TextEditingController _txtPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Provider<SignUpBloc>(
        create: (_) => SignUpBloc(userRepo: Provider.of<UserRepo>(context)),
        child: Consumer<SignUpBloc>(
          builder: (context, signUpBloc, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: StreamProvider<String?>.value(
                  value: signUpBloc.txtNameSubjectStream,
                  initialData: null,
                  builder: (context, child) => Consumer<String?>(
                    builder: (context, value, child) =>
                        CustomTextField.normalTextBox(
                      _txtNameController,
                      error: value,
                      onChange: <String>(value) {
                        signUpBloc.txtNameSubjectSink.add(value.toString());
                      },
                    ),
                  ),
                ),
                margin: EdgeInsets.only(bottom: 16),
              ),
              Container(
                child: StreamProvider<String?>.value(
                  value: signUpBloc.txtPhoneSubjectStream,
                  initialData: null,
                  builder: (context, child) => Consumer<String?>(
                    builder: (context, value, child) =>
                        CustomTextField.phoneTextBox(
                      _txtPhoneController,
                      error: value,
                      onChange: <String>(value) {
                        signUpBloc.txtPhoneSubjectSink.add(value.toString());
                      },
                    ),
                  ),
                ),
                margin: EdgeInsets.only(bottom: 16),
              ),
              Container(
                child: StreamProvider<String?>.value(
                  value: signUpBloc.txtPassSubjectStream,
                  initialData: null,
                  builder: (context, snapshot) => Consumer<String?>(
                    builder: (context, value, child) =>
                        CustomTextField.passswordTextBox(
                      _txtPassController,
                      error: value,
                      onChange: <String>(value) {
                        signUpBloc.txtPassSubjectSink.add(value.toString());
                      },
                    ),
                  ),
                ),
                margin: EdgeInsets.only(bottom: 30),
              ),
              Container(
                child: StreamProvider<bool>.value(
                  value: signUpBloc.btnSignUpSubjectStream,
                  initialData: false,
                  builder: (context, child) => Consumer<bool>(
                    builder: (context, value, child) => NormalButton(
                      onPress: value
                          ? () {
                              SignUpEvent signUpEvent = SignUpEvent(
                                phone: _txtPhoneController.text,
                                password: _txtPassController.text,
                                displayName: _txtNameController.text,
                              );

                              signUpBloc.eventSink.add(signUpEvent);
                            }
                          : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
