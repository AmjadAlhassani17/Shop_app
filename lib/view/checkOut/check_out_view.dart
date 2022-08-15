// ignore_for_file: deprecated_member_use, unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constant.dart';
import 'package:shop_app/core/view_model/check_out_view_model.dart';
import 'package:shop_app/view/checkOut/add_address_view.dart';
import 'package:shop_app/view/checkOut/delivery_time_view.dart';
import 'package:shop_app/view/checkOut/summary_view.dart';
import 'package:shop_app/view/controller.dart';
import 'package:shop_app/view/widgets/custom_buttom.dart';
import 'package:shop_app/view/widgets/custom_text.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:status_change/status_change.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: CustomText(
              text: 'Order Status',
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
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                // ignore: avoid_unnecessary_containers
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      color: Colors.white,
                      width: double.infinity,
                      child: StatusChange.tileBuilder(
                        theme: StatusChangeThemeData(
                          direction: Axis.horizontal,
                          connectorTheme: const ConnectorThemeData(
                              space: 1.0, thickness: 1.0),
                        ),
                        builder: StatusChangeTileBuilder.connected(
                          itemWidth: (_) =>
                              MediaQuery.of(context).size.width /
                              _processes.length,
                          nameWidgetBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                _processes[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: controller.getColor(index),
                                ),
                              ),
                            );
                          },
                          indicatorWidgetBuilder: (_, index) {
                            if (index <= controller.index) {
                              return DotIndicator(
                                size: 35.0,
                                border:
                                    Border.all(color: Colors.green, width: 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return const OutlinedDotIndicator(
                                size: 30,
                                borderWidth: 1.0,
                                color: todoColor,
                              );
                            }
                          },
                          lineWidgetBuilder: (index) {
                            if (index > 0) {
                              if (index == controller.index) {
                                final prevColor =
                                    controller.getColor(index - 1);
                                final color = controller.getColor(index);
                                // ignore: prefer_typing_uninitialized_variables
                                var gradientColors;
                                gradientColors = [
                                  prevColor,
                                  Color.lerp(prevColor, color, 0.5)
                                ];
                                return DecoratedLineConnector(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: gradientColors,
                                    ),
                                  ),
                                );
                              } else {
                                return SolidLineConnector(
                                  color: controller.getColor(index),
                                );
                              }
                            } else {
                              return null;
                            }
                          },
                          itemCount: _processes.length,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    controller.pages == Pages.DeliveryTime
                        ? const DeliveryTime()
                        : controller.pages == Pages.AddAddress
                            ? const AddAddress()
                            : const Summary(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        controller.index == 0 ? Container() :  Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: 200,
                            height: 100,
                            child: FlatButton(
                              padding: const EdgeInsets.all(15),
                              onPressed: (){
                                controller.changeIndex(controller.index - 1);
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(0),
                                    side: const BorderSide(color: Colors.green)
                              ),
                              color: Colors.white,
                              child: CustomText(
                                text: 'BACK',
                                color: Colors.green,
                                size: 14,
                                font: FontWeight.normal,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: 200,
                            height: 100,
                            child: CustomButtom(
                              text: "NEXT",
                              alignment: Alignment.center,
                              onPressed: () {
                                controller.changeIndex(controller.index + 1);
                              },
                              border: 0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summery',
];

final _content = [
  '20/18',
  '20/18',
  '20/18',
  '20/18',
  '20/18',
];
