// ignore_for_file: unnecessary_null_comparison

import 'package:shop_app/model/cart_product_model.dart';

class OrderModel {
  String? userId, dataTime;
  Address? address;
  List<CartProduct>? product;

  OrderModel({
    this.userId,
    this.dataTime,
    this.address,
    this.product,
  });
    OrderModel.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    dataTime = map['dataTime'];
    address = map['address'];
    product = map['product'];
  }
  Map<String,dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'userId': userId,
      'dataTime': dataTime,
      'address': address,
      'product': product,
    } as Map<String,dynamic>;
  }
}

class Address {
  String? street1, street2, city, state, country;

  Address({
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.country,
  });

  Address.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    street1 = map['street1'];
    street2 = map['street2'];
    city = map['city'];
    state = map['state'];
    country = map['country'];
  }
  Map<String,dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'country': country,
    } as Map<String,dynamic>;
  }
}
