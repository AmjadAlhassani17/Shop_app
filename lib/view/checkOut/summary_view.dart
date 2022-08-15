import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/cart_view_model.dart';
import 'package:shop_app/core/view_model/check_out_view_model.dart';
import 'package:shop_app/view/widgets/custom_text.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) => Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 180,
              padding: const EdgeInsets.only(left: 20),
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // ignore: avoid_unnecessary_containers
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 120,
                          width: 120,
                          child: Image.network(
                            controller.cart[index].image as String,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: controller.cart[index].name as String,
                          size: 16,
                          color: Colors.black,
                          font: FontWeight.normal,
                          alignment: Alignment.topLeft,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: '\$ ${controller.cart[index].price}',
                          size: 16,
                          color: Colors.green,
                          font: FontWeight.normal,
                          alignment: Alignment.topLeft,
                        ),
                      ],
                    ),
                  );
                },
                itemCount: controller.cart.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 20,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomText(
                text: 'Shipping Address',
                size: 18,
                color: Colors.black,
                font: FontWeight.bold,
                alignment: Alignment.topLeft,
              ),
            ),
            GetBuilder<CheckOutViewModel>(
              init: CheckOutViewModel(),
              builder: (controller) => Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,20),
                child: CustomText(
                  text:
                      // ignore: unnecessary_string_interpolations
                      '''${controller.Street1! + ' , ' + (controller.Street2 as String) + ' , ' + (controller.City as String) + ' , ' + (controller.State as String) + ' , ' + (controller.Country as String)}''',
                  size: 16,
                  color: Colors.black,
                  font: FontWeight.normal,
                  alignment: Alignment.topLeft,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
