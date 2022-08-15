// ignore_for_file: unnecessary_null_comparison

import 'package:shop_app/constant.dart';

class CartProduct {
  String? image, name , id;
  late int quantity;
  late int price;

  CartProduct({this.image, this.name, required this.price, required this.quantity, this.id});
  CartProduct.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    image = map[columnImage];
    name = map[columnName];
    price = map[columnPrice];
    quantity = map[columnQuantity];
    id = map[columnId];
  }
  toJson() {
    return {
      columnImage: image,
      columnName: name,
      columnPrice: price,
      columnQuantity: quantity,
      columnId: id,
    };
  }
}
