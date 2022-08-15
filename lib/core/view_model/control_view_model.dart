// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/view/cart_view.dart';
import 'package:shop_app/view/user_view.dart';
import '../../view/home_screen.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget _currentScreen = const HomeScreen();
  get navigator => _navigatorValue;
  get currentScrren => _currentScreen;
  void ChangeNavigatorValue(int Selector) {
    _navigatorValue = Selector;
    switch (Selector) {
      case 0:
        {
          _currentScreen = const HomeScreen();
          break;
        }
      case 1:
        {
          _currentScreen =  CartView(model: SellingProduct(),);
          break;
        }
      case 2:
        {
          _currentScreen = const UserView();
          break;
        }
    }
    update();
  }
}
