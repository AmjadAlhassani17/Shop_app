// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

import '../helper/extenstion.dart';

class SellingProduct {
  String? image, name, discription, price, size, alotdis , id;
  late Color color;

  SellingProduct(
      {this.image,
      this.name,
      this.discription,
      this.price,
      this.size,
      this.alotdis,
      this.id
      });
  SellingProduct.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    image = map['image'];
    name = map['name'];
    discription = map['discription'];
    price = map['price'];
    size = map['size'];
    alotdis = map['alotdis'];
    id = map['id'];
    color = HexColor.fromHex(map['color']);
  }
  toJson() {
    return {
      'image': image,
      'name': name,
      'discription': discription,
      'price': price,
      'size': size,
      'color': color,
      'alotdis': alotdis,
      'id': id
    };
  }
}
