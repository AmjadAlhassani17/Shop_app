// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/home_view_model.dart';
import 'package:shop_app/view/details_view.dart';
import 'package:shop_app/view/devices_categorie.dart';
import 'package:shop_app/view/gadgets_categorie.dart';
import 'package:shop_app/view/gaming_categorie.dart';
import 'package:shop_app/view/men_categorie.dart';
import 'package:shop_app/view/widgets/custom_text.dart';
import 'package:shop_app/view/women_categorie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200,
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomText(
                          text: "Categories",
                          size: 18,
                          color: Colors.black,
                          font: FontWeight.bold,
                          alignment: Alignment.topLeft,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 100,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categoryModel.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  switch (index) {
                                    case 0:
                                      {
                                        Get.to(() => const MenCategorie());
                                        break;
                                      }
                                    case 1:
                                      {
                                        Get.to(() => const WomenCategore());
                                        break;
                                      }
                                    case 2:
                                      {
                                        Get.to(() => const DevicesCategorie());
                                        break;
                                      }
                                    case 3:
                                      {
                                        Get.to(() => const GadgetsCategorie());
                                        break;
                                      }
                                    case 4:
                                      {
                                        Get.to(() => const GamingCategorie());
                                        break;
                                      }
                                  }
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.grey.shade100,
                                      ),
                                      height: 60,
                                      width: 60,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(controller
                                            .categoryModel[index]
                                            .image as String),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomText(
                                      text: controller.categoryModel[index].name
                                          as String,
                                      size: 12,
                                      color: Colors.black,
                                      font: FontWeight.normal,
                                      alignment: Alignment.center,
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Best Selling",
                              size: 18,
                              color: Colors.black,
                              font: FontWeight.bold,
                              alignment: Alignment.topLeft,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: CustomText(
                                text: "See all",
                                size: 16,
                                color: Colors.black,
                                font: FontWeight.normal,
                                alignment: Alignment.topLeft,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 330,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.productModel.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => DetailsView(
                                      model: controller.productModel[index]));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Container(
                                          height: 240,
                                          child: Image.network(
                                            controller.productModel[index].image
                                                as String,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                        text: controller
                                            .productModel[index].name as String,
                                        size: 16,
                                        color: Colors.black,
                                        font: FontWeight.w400,
                                        alignment: Alignment.topLeft,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                        text: controller.productModel[index]
                                            .discription as String,
                                        size: 12,
                                        color: Colors.grey,
                                        font: FontWeight.normal,
                                        alignment: Alignment.topLeft,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                        text: '\$ ${controller.productModel[index].price}',
                                        size: 16,
                                        color: const Color.fromRGBO(
                                            0, 197, 105, 1),
                                        font: FontWeight.w500,
                                        alignment: Alignment.topLeft,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
