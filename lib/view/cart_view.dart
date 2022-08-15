// ignore_for_file: deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/cart_view_model.dart';
import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/view/checkOut/check_out_view.dart';
import 'package:shop_app/view/widgets/custom_text.dart';

// ignore: must_be_immutable
class CartView extends StatelessWidget {
  CartView({Key? key , required this.model}) : super(key: key);
  SellingProduct model;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => controller.cart.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assetss/imagee/undraw_empty_cart_co35.svg',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomText(
                  text: 'Cart empty',
                  size: 20,
                  color: Colors.black,
                  font: FontWeight.w500,
                  alignment: Alignment.center,
                )
              ],
            )
          : Scaffold(
              // ignore: avoid_unnecessary_containers
              body: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                         
                            return Dismissible(
                              key: UniqueKey(),
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                              ),
                              onDismissed: (DismissDirection dir) {
                                controller.deleteProduct(index);
                              },
                              child: Container(
                                height: 140,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      controller.cart[index].image as String,
                                      height: 140,
                                      width: 140,
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: CustomText(
                                            text: controller.cart[index].name
                                                as String,
                                            size: 16,
                                            color: Colors.black,
                                            font: FontWeight.w500,
                                            alignment: Alignment.topLeft,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomText(
                                          text:
                                              '\$ ${controller.cart[index].price}',
                                          size: 16,
                                          color: const Color.fromRGBO(
                                              0, 197, 105, 1),
                                          font: FontWeight.w500,
                                          alignment: Alignment.topLeft,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          width: 95,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Colors.grey.shade300,
                                            ),
                                            color: Colors.grey.shade300,
                                          ),
                                          child: GetBuilder<CartViewModel>(
                                            init: CartViewModel(),
                                            builder: (controller) => Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.InCreaseQuantity(
                                                        index);
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                CustomText(
                                                  text:
                                                      '${controller.cart[index].quantity}',
                                                  size: 16,
                                                  color: Colors.black,
                                                  font: FontWeight.normal,
                                                  alignment: Alignment.center,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.DeCreaseQuantity(
                                                        index);
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: controller.cart.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 15,
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
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
                                text: 'TOTAL',
                                size: 14,
                                color: Colors.black,
                                font: FontWeight.normal,
                                alignment: Alignment.bottomCenter,
                              ),
                              GetBuilder<CartViewModel>(
                                init: CartViewModel(),
                                builder: (controller) => CustomText(
                                  // ignore: unnecessary_cast
                                  text: '\$ ${controller.totalPrice}',
                                  size: 18,
                                  color: const Color.fromRGBO(0, 197, 105, 1),
                                  font: FontWeight.bold,
                                  alignment: Alignment.bottomCenter,
                                ),
                              ),
                            ],
                          ),
                          FlatButton(
                            onPressed: () {
                              Get.to(const CheckOut());
                            },
                            color: const Color.fromRGBO(0, 197, 105, 1),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 40, right: 40),
                              child: CustomText(
                                text: 'CHECKOUT',
                                alignment: Alignment.center,
                                size: 14,
                                font: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
