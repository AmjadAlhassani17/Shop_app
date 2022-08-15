// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/check_out_view_model.dart';
import 'package:shop_app/view/widgets/custom_text.dart';

enum Delivery { StandardDelivery, NextDayDelivery, NominatedDelivery }

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CheckOutViewModel>(
        init: CheckOutViewModel(),
        builder: (controller) => Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
          child: Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  selectedColor: Colors.green,
                  title: CustomText(
                    text: 'Standard Delivery',
                    color: Colors.black,
                    alignment: Alignment.topLeft,
                    size: 18,
                    font: FontWeight.bold,
                  ),
                  subtitle: CustomText(
                    text: '''

Order will be delivered between 3 - 5 
business days

''',
                    color: Colors.black,
                    alignment: Alignment.topLeft,
                    size: 14,
                    font: FontWeight.normal,
                  ),
                  trailing: Radio<Delivery>(
                    value: Delivery.StandardDelivery,
                    groupValue: controller.character,
                    onChanged: (Delivery? value) {
                      controller.changecharacter(value);
                    },
                  ),
                ),
                ListTile(
                  title: CustomText(
                    text: 'Next Day Delivery',
                    color: Colors.black,
                    alignment: Alignment.topLeft,
                    size: 18,
                    font: FontWeight.bold,
                  ),
                  subtitle: CustomText(
                    text: '''

Place your order before 6pm and your items
will be delivered the next day

''',
                    color: Colors.black,
                    alignment: Alignment.topLeft,
                    size: 14,
                    font: FontWeight.normal,
                  ),
                  trailing: Radio<Delivery>(
                    value: Delivery.NextDayDelivery,
                    groupValue: controller.character,
                    onChanged: (Delivery? value) {
                      controller.changecharacter(value);
                    },
                  ),
                ),
                ListTile(
                  title: CustomText(
                    text: 'Nominated Delivery',
                    color: Colors.black,
                    alignment: Alignment.topLeft,
                    size: 18,
                    font: FontWeight.bold,
                  ),
                  subtitle: CustomText(
                    text: '''

Pick a particular date from the calendar and
order will be delivered on selected date

''',
                    color: Colors.black,
                    alignment: Alignment.topLeft,
                    size: 14,
                    font: FontWeight.normal,
                  ),
                  trailing: Radio<Delivery>(
                    value: Delivery.NominatedDelivery,
                    groupValue: controller.character,
                    onChanged: (Delivery? value) {
                      controller.changecharacter(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
