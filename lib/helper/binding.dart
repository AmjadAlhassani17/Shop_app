import 'package:get/get.dart';
import 'package:shop_app/core/view_model/auth_view_model.dart';
import 'package:shop_app/core/view_model/check_out_view_model.dart';
import 'package:shop_app/core/view_model/control_view_model.dart';
import 'package:shop_app/core/view_model/home_view_model.dart';
import 'package:shop_app/helper/local_storage_data.dart';
import '../core/view_model/cart_view_model.dart';
import '../core/view_model/profile_view_model.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => CheckOutViewModel());
  }
}