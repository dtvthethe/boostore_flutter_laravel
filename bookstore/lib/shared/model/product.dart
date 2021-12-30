class Product {
  late String orderId;
  late String productId;
  late String productName;
  late String? productImage;
  late int quantity;
  late double price;

  Product({
    required this.orderId,
    required this.productId,
    required this.productName,
    this.productImage,
    required this.quantity,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        orderId: json['orderId'],
        productId: json['productId'],
        productName: json['productName'],
        productImage: json['productImage'],
        quantity: int.parse(json['quantity'] ?? 0),
        price: double.parse(json['price'] ?? 0),
      );

  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'productId': productId,
        'productName': productName,
        'productImage': productImage,
        'quantity': quantity,
        'price': price,
      };
}
