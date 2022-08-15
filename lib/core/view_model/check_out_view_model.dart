// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constant.dart';
import 'package:shop_app/view/controller.dart';

import '../../view/checkOut/delivery_time_view.dart';

class CheckOutViewModel extends GetxController {
  Delivery? get character => _character;
  Delivery? _character = Delivery.StandardDelivery;

  int get index => _index;
  int _index = 0;

  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final street1 = TextEditingController();
  final street2 = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  // ignore: non_constant_identifier_names
  String? Street1 , Street2 , City , State , Country;

  void changeIndex(int i) {
    if(i == 0 || i < 0){
      _pages = Pages.DeliveryTime;
      _index = i;
    } else if (i == 1) {
      _pages = Pages.AddAddress;
      _index = i;
    } else if (i == 2) {
      formKey.currentState!.save();
      if(formKey.currentState!.validate()){
        _pages = Pages.Summary;
        _index = i;
      }
    } else if (i == 3) {
      Get.to(() => const ControlView());
      _pages = Pages.DeliveryTime;
      _index = 0;
    }
    update();
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  changecharacter(var value) {
    _character = value;
    update();
  }
}
