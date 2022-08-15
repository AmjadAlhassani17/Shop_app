import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/auth_view_model.dart';
import 'package:shop_app/view/auth/login_screen.dart';
import '../core/view_model/control_view_model.dart';

class ControlView extends GetWidget<ViewModel> {
  const ControlView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<ViewModel>().user == null)
          ? LogInScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScrren,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        elevation: 0.5,
        backgroundColor: Colors.white,
        currentIndex: controller.navigator,
        onTap: (index) {
          controller.ChangeNavigatorValue(index);
        },
        items: [
          BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text("Explore"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Image.asset(
                  "assetss/imagee/Icon_Explore.png",
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text("Cart"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Image.asset(
                  "assetss/imagee/Group 183.png",
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text("Account"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Image.asset(
                  "assetss/imagee/Icon_User.png",
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
        ],
      ),
    );
  }
}
