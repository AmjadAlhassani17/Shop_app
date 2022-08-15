// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/profile_view_model.dart';
import 'package:shop_app/view/auth/login_screen.dart';
import 'package:shop_app/view/widgets/custom_text.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.Loading.value ? const Center(child: CircularProgressIndicator()) : Scaffold(
        body: Container(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  height: 120,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: controller.userModel == null
                                  ? const AssetImage('assetss/imagee/user.png')
                                  : controller.userModel.pic == 'default'
                                      ? const AssetImage(
                                              'assetss/imagee/user.png')
                                          as ImageProvider
                                      : NetworkImage(
                                          controller.userModel.pic as String),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 28, 70, 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: controller.userModel.name as String,
                              size: 26,
                              color: Colors.black,
                              font: FontWeight.w500,
                              alignment: Alignment.centerLeft,
                            ),
                            CustomText(
                              text: controller.userModel.email as String,
                              size: 20,
                              color: Colors.black,
                              font: FontWeight.w500,
                              alignment: Alignment.centerLeft,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    leading: Image.asset('assetss/imagee/Icon_Edit-Profile.png'),
                    title: CustomText(
                      text: 'Edit Profile',
                      color: Colors.black,
                      alignment: Alignment.centerLeft,
                      size: 18,
                      font: FontWeight.normal,
                    ),
                    trailing: const Icon(Icons.navigate_next),
                  ),
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    leading: Image.asset('assetss/imagee/Icon_Location.png'),
                    title: CustomText(
                      text: 'Shipping Address',
                      color: Colors.black,
                      alignment: Alignment.centerLeft,
                      size: 18,
                      font: FontWeight.normal,
                    ),
                    trailing: const Icon(Icons.navigate_next),
                  ),
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    leading: Image.asset('assetss/imagee/Icon_History.png'),
                    title: CustomText(
                      text: 'Order History',
                      color: Colors.black,
                      alignment: Alignment.centerLeft,
                      size: 18,
                      font: FontWeight.normal,
                    ),
                    trailing: const Icon(Icons.navigate_next),
                  ),
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    leading: Image.asset('assetss/imagee/Icon_Payment.png'),
                    title: CustomText(
                      text: 'Cards',
                      color: Colors.black,
                      alignment: Alignment.centerLeft,
                      size: 18,
                      font: FontWeight.normal,
                    ),
                    trailing: const Icon(Icons.navigate_next),
                  ),
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    leading: Image.asset('assetss/imagee/Icon_Alert.png'),
                    title: CustomText(
                      text: 'Notifications',
                      color: Colors.black,
                      alignment: Alignment.centerLeft,
                      size: 18,
                      font: FontWeight.normal,
                    ),
                    trailing: const Icon(Icons.navigate_next),
                  ),
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    controller.signOut();
                    Get.offAll(() => LogInScreen());
                  },
                  child: ListTile(
                    leading: Image.asset('assetss/imagee/Icon_Exit.png'),
                    title: CustomText(
                      text: 'Log Out',
                      color: Colors.black,
                      alignment: Alignment.centerLeft,
                      size: 18,
                      font: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
