import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/model/product_model.dart';
import '../../model/category_model.dart';

class HomeViewModel extends GetxController{
  ValueNotifier<bool> get loading => _loading;
  // ignore: prefer_final_fields
  ValueNotifier<bool> _loading = ValueNotifier(false);
  // ignore: unused_field
  final CollectionReference _categorycollection = FirebaseFirestore.instance.collection('category');
  // ignore: unused_field
  final CollectionReference _productcollection = FirebaseFirestore.instance.collection('Products');
  // ignore: unused_field
  final CollectionReference _menproductcollection = FirebaseFirestore.instance.collection('MenProducts');
  // ignore: unused_field
  final CollectionReference _womenproductcollection = FirebaseFirestore.instance.collection('WomenProduct');
  // ignore: prefer_final_fields
  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;
  // ignore: prefer_final_fields
  List<SellingProduct> _productModel = [];
  List<SellingProduct> get productModel => _productModel;
  // ignore: prefer_final_fields, unused_field
  List<SellingProduct> _menproductModel = [];
  List<SellingProduct> get menproductModel => _menproductModel;
  // ignore: prefer_final_fields
  List<SellingProduct> _womenproductmodel = [];
  List<SellingProduct> get womenproductModel => _womenproductmodel;
  
  HomeViewModel(){
    getCategory();
    getBestSellingProducts();
    getMenCategory();
    getWomenCategory();
  }

  getCategory() async {
    _loading.value = true;
    await _categorycollection.get().then((value) {
      for(int i = 0 ; i < value.docs.length ; i++){
        _categoryModel.add(CategoryModel.fromJson(value.docs[i].data() as Map<dynamic, dynamic>));
        // ignore: avoid_print
        print(_categoryModel.length);
        _loading.value = false;
      }
      update();
    });
  }

  getMenCategory() async {
    _loading.value = true;
    await _menproductcollection.get().then((value) {
      for(int i = 0 ; i < value.docs.length ; i++){
        _menproductModel.add(SellingProduct.fromJson(value.docs[i].data() as Map<dynamic, dynamic>));
        // ignore: avoid_print
        print(_menproductModel.length);
        _loading.value = false;
      }
      update();
    });
  }

  getWomenCategory() async {
    _loading.value = true;
    await _womenproductcollection.get().then((value) {
      for(int i = 0 ; i < value.docs.length ; i++){
        _womenproductmodel.add(SellingProduct.fromJson(value.docs[i].data() as Map<dynamic, dynamic>));
        // ignore: avoid_print
        print(_womenproductmodel.length);
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts () async{
    _loading.value = true;
    await _productcollection.get().then((value) {
      for(int i = 0 ; i < value.docs.length ; i++){
        _productModel.add(SellingProduct.fromJson(value.docs[i].data() as Map<dynamic, dynamic>));
        // ignore: avoid_print
        print(_productModel.length);
        _loading.value = false;
      }
      update();
    });
  }
}