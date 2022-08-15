// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/cart_view_model.dart';
import 'package:shop_app/model/cart_product_model.dart';
import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/view/widgets/custom_text.dart';

// ignore: must_be_immutable
class DetailsView extends StatelessWidget {
  DetailsView({Key? key, required this.model}) : super(key: key);
  SellingProduct model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: Image.network(
                  model.image.toString(),
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      CustomText(
                          text: model.name.toString(),
                          size: 26,
                          color: Colors.black,
                          font: FontWeight.bold,
                          alignment: Alignment.topLeft),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomText(
                                  text: 'Size',
                                  size: 14,
                                  color: Colors.black,
                                  font: FontWeight.normal,
                                  alignment: Alignment.centerLeft,
                                ),
                                const SizedBox(
                                  width: 75,
                                ),
                                CustomText(
                                  text: model.size.toString(),
                                  size: 14,
                                  color: Colors.black,
                                  font: FontWeight.bold,
                                  alignment: Alignment.centerRight,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomText(
                                  text: 'Colour',
                                  size: 14,
                                  color: Colors.black,
                                  font: FontWeight.normal,
                                  alignment: Alignment.centerLeft,
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      color: model.color),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: 'Details',
                        size: 18,
                        color: Colors.black,
                        font: FontWeight.bold,
                        alignment: Alignment.topLeft,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: model.alotdis as String,
                        size: 18,
                        color: Colors.black,
                        font: FontWeight.normal,
                        alignment: Alignment.topLeft,
                        height: 2.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GetBuilder<CartViewModel>(
              init: CartViewModel(),
              builder: (controller) => Container(
                height: 80,
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 15, bottom: 15),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'PRICE',
                          size: 14,
                          color: Colors.black,
                          font: FontWeight.normal,
                          alignment: Alignment.bottomCenter,
                        ),
                        CustomText(
                          text: model.price.toString(),
                          size: 18,
                          color: const Color.fromRGBO(0, 197, 105, 1),
                          font: FontWeight.bold,
                          alignment: Alignment.bottomCenter,
                        ),
                      ],
                    ),
                    FlatButton(
                      onPressed: () {
                        controller.addProduct(
                          CartProduct(
                            name: model.name,
                            image: model.image,
                            price: int.parse(model.price as String),
                            quantity: 1,
                            id: model.id
                          ), 
                        );
                      },
                      color: const Color.fromRGBO(0, 197, 105, 1),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 45, right: 45),
                        child: CustomText(
                          text: 'ADD',
                          alignment: Alignment.center,
                          size: 14,
                          font: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
