import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class PageContainer extends StatelessWidget {
  final String title;
  final Widget child;
  // TODO: SingleChildWidget la gi, `bloc` vs `di` vs `actions` dung de lam gi
  final List<SingleChildWidget> bloc;
  final List<SingleChildWidget> di;
  // TODO: actions taskbar right
  final List<Widget> actions;

  PageContainer({
    required this.title,
    required this.child,
    required this.bloc,
    required this.di,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    if (di.isEmpty) {
      print('block and di are Empty');
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
          // actions: actions,
        ),
        body: child,
      );
    } else {
      print('block and di apply');
      return MultiProvider(
        providers: [
          // ...bloc,
          ...di,
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            // actions: actions,
          ),
          body: child,
        ),
      );
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   if (bloc.isEmpty && di.isEmpty) {
  //     print('block and di are Empty');
  //     return Scaffold(
  //       appBar: AppBar(
  //         title: Text(title),
  //         // actions: actions,
  //       ),
  //       body: child,
  //     );
  //   } else {
  //     print('block and di apply');
  //     return MultiProvider(
  //       providers: [
  //         ...bloc,
  //         ...di,
  //       ],
  //       child: Scaffold(
  //         appBar: AppBar(
  //           title: Text(title),
  //           // actions: actions,
  //         ),
  //         body: child,
  //       ),
  //     );
  //   }
  // }
}
