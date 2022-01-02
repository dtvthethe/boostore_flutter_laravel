import 'package:badges/badges.dart';
import 'package:bookstore/base/base_widget.dart';
import 'package:bookstore/shared/app_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: 'Home Page',
      child: HomeWidget(),
      actions: [
        Container(
          margin: EdgeInsets.only(top: 15, right: 20),
          child: Badge(
            badgeContent: Text(
              '10',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: Icon(Icons.shopping_cart),
          ),
        )
      ],
      bloc: [],
      di: [],
    );
  }
}

class HomeWidget extends StatelessWidget {
  final String URL_IMG =
      'https://blogger.googleusercontent.com/img/a/AVvXsEghmOKy16w-I4fJy5GE3O65hiGbxPQAweXqVzEW0fM_eEbNeetvUTr9WwT5SsWO6ezp80hGNK5WnntJhWQjnSrZqRBl1aWuXJNVkGwabgCYUw6TfXQHrOKPqrDzSF0LU58Am6IdSpVpf0h7qm4D1ulh0zvNKxfLIu9iCaS0xZ5XIaDHFaZiRuleyH22';
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Card(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                URL_IMG,
                width: 100,
                height: 150,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 15, right: 10),
                    child: Text(
                      'Ten sp',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 15),
                    child: Text(
                      'Con hang (100)',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 15),
                    child: ElevatedButton(
                      child: Text(
                        'Add Cart',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
