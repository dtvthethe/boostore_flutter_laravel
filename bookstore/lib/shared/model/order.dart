import 'package:bookstore/shared/model/product.dart';

class Order {
  late double total;
  late List<Product> items;

  Order({required this.total, required this.items});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        total: double.parse(json['total']),
        items: parseProductList(json['items']),
      );

  static List<Product> parseProductList(dynamic json) {
    List<dynamic> list = json as List;

    return list.map((_) => Product.fromJson(_)).toList();
  }
}
