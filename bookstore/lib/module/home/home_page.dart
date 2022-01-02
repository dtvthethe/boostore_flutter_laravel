import 'package:bookstore/base/base_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: 'Home Page',
      child: Center(
        child: Text('Product List'),
      ),
      actions: [],
      bloc: [],
      di: [],
    );
  }
}
