import 'package:bookstore/base/base_bloc.dart';
import 'package:bookstore/base/base_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlocListener<T extends BaseBloc> extends StatefulWidget {
  final Widget child;
  final Function(BaseEvent event) listener;

  BlocListener({required this.child, required this.listener});

  // _BlocListenerState<T>(): phai co T
  @override
  _BlocListenerState createState() => _BlocListenerState<T>();
}

class _BlocListenerState<T> extends State<BlocListener> {
  @override
  void didChangeDependencies() {
    print('didChangeDependencies load.');
    super.didChangeDependencies();
    // Dang ki listener cho processStream:
    var bloc = Provider.of<T>(context) as BaseBloc;
    bloc.processStream.listen((event) {
      widget.listener(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: (Provider.of<T>(context) as BaseBloc).processStream,
      initialData: null,
      updateShouldNotify: (previous, current) =>
          false, //false ko cho build lai Ui
      child: Consumer<T>(
        builder: (context, value, child) => widget.child,
      ),
    );
  }
}
