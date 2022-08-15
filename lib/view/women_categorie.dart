// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/home_view_model.dart';
import 'package:shop_app/view/controller.dart';
import 'package:shop_app/view/details_view.dart';
import 'package:shop_app/view/widgets/custom_text.dart';

class WomenCategore extends StatelessWidget {
  const WomenCategore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: CustomText(
            text: 'Women',
            size: 20,
            color: Colors.black,
            font: FontWeight.normal,
            alignment: Alignment.topCenter,
          ),
        ),
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => Get.to(() => const ControlView()),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: GetBuilder<HomeViewModel>(
          init: HomeViewModel(),
          builder: (controller) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.55,
              crossAxisSpacing: 20,
              mainAxisSpacing: 0,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Get.to(DetailsView(
                  model: controller.womenproductModel[index],
                )),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      Container(
                        child: Container(
                          width: 200,
                          height: 225,
                          child: Image.network(
                            controller.womenproductModel[index].image as String,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text:
                            controller.womenproductModel[index].name as String,
                        size: 16,
                        color: Colors.black,
                        font: FontWeight.w400,
                        alignment: Alignment.topLeft,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: controller.womenproductModel[index].discription
                            as String,
                        size: 12,
                        color: Colors.grey,
                        font: FontWeight.normal,
                        alignment: Alignment.topLeft,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: '\$ ${controller.womenproductModel[index].price}',
                        size: 16,
                        color: const Color.fromRGBO(0, 197, 105, 1),
                        font: FontWeight.w500,
                        alignment: Alignment.topLeft,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
