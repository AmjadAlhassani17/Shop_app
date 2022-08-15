// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/helper/local_storage_data.dart';
import 'package:shop_app/model/user_model.dart';

class ProfileViewModel extends GetxController{

  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get Loading => _loading;

  @override
  void onInit() {
 
    super.onInit();
    getCurrentUser();
  }

  final LocalStorageData localStorageData = Get.find();

  UserModel _userModel = Get.put(UserModel());
  UserModel get userModel => _userModel;


  void getCurrentUser() async{
    _loading.value = true;
    await localStorageData.getUser.then((value){
      _userModel = value as UserModel;
    });
    _loading.value = false;
    update();
  }

  Future<void> signOut() async{
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deletUser();
  }
}