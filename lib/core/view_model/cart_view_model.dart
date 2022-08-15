// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/services/database/database_helper.dart';
import 'package:shop_app/model/cart_product_model.dart';

class CartViewModel extends GetxController {
  // ignore: prefer_final_fields
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  List<CartProduct> _cart = [];
  List<CartProduct> get cart => _cart;
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _cart = await dbHelper.getAllProduct();
    _loading.value = false;
    getTotalPrice();
    update();
  }
  //kjhk
  addProduct(CartProduct cartProduct) async {
    var dbHelper = CartDatabaseHelper.db;
    if (_cart.isEmpty) {
      await dbHelper.insert(cartProduct);
      _cart.add(cartProduct);
    } else {
      for (int i = 0; i < _cart.length; i++) {
        if (cartProduct.id == _cart[i].id) {
          return;
        }
      }
      await dbHelper.insert(cartProduct);
      _cart.add(cartProduct);
    }
    update();
  }

  deleteProduct(int itemid) async {
    var dbHelper = CartDatabaseHelper.db;
    if (_cart[itemid].quantity > 0) {
      _totalPrice -= (double.parse(
          _cart[itemid].price.toString() * _cart[itemid].quantity));
    }
    await dbHelper.delete(cart[itemid].id as String);
    _cart.removeAt(itemid);
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cart.length; i++) {
      _totalPrice +=
          (double.parse(_cart[i].price.toString()) * _cart[i].quantity);
    }
    update();
  }

  InCreaseQuantity(int index) async {
    var dbHelper = CartDatabaseHelper.db;
    _cart[index].quantity++;
    _totalPrice += (double.parse(_cart[index].price.toString()));
    await dbHelper.update(_cart[index]);
    update();
  }

  DeCreaseQuantity(int index) async {
    var dbHelper = CartDatabaseHelper.db;
    _cart[index].quantity--;
    _totalPrice -= (double.parse(_cart[index].price.toString()));
    await dbHelper.update(_cart[index]);
    update();
  }
}
