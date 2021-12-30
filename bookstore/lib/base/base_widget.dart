import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class PageController extends StatelessWidget {
  final String title;
  final Widget child;
  // TODO: SingleChildWidget la gi, `bloc` vs `di` vs `actions` dung de lam gi
  final List<SingleChildWidget> bloc;
  final List<SingleChildWidget> di;
  // TODO: actions taskbar right
  final List<Widget> actions;

  PageController(this.title, this.child, this.bloc, this.di, this.actions);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...di,
        ...bloc,
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: actions,
        ),
        body: child,
      ),
    );
  }
}
