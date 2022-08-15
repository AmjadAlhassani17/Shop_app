import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/check_out_view_model.dart';
import 'package:shop_app/view/widgets/custom_text.dart';

// ignore: must_be_immutable
class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder:(controller) => Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomText(
                  text: 'Billing address is the same as delivery address',
                  size: 14,
                  color: Colors.black,
                  font: FontWeight.normal,
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Street 1',
                        size: 14,
                        color: Colors.grey,
                        font: FontWeight.normal,
                        alignment: Alignment.topLeft,
                      ),
                      TextFormField(
                        controller: controller.street1,
                        decoration: const InputDecoration(
                          hintText: '21, Alex Davidson Avenue',
                          hintStyle: TextStyle(fontSize: 18, color: Colors.black12),
                        ),
                        keyboardType: TextInputType.streetAddress,
                        onSaved: (String? value) {
                          controller.Street1 = value;
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Your Street 1 is not correct.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: 'Street 2',
                        size: 14,
                        color: Colors.grey,
                        font: FontWeight.normal,
                        alignment: Alignment.topLeft,
                      ),
                      TextFormField(
                        controller: controller.street2,
                        decoration: const InputDecoration(
                          hintText: 'Opposite Omegatron, Vicent Quarters',
                          hintStyle: TextStyle(fontSize: 18, color: Colors.black12),
                        ),
                        keyboardType: TextInputType.streetAddress,
                        onSaved: (String? value) {
                          controller.Street2 = value;
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Your Street 2 is not correct.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: 'City',
                        size: 14,
                        color: Colors.grey,
                        font: FontWeight.normal,
                        alignment: Alignment.topLeft,
                      ),
                      TextFormField(
                        controller: controller.city,
                        decoration: const InputDecoration(
                          hintText: 'Victoria Island',
                          hintStyle: TextStyle(fontSize: 18, color: Colors.black12),
                        ),
                        keyboardType: TextInputType.streetAddress,
                        onSaved: (String? value) {
                          controller.City = value;
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Your City is not correct.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CustomText(
                                  text: 'State',
                                  size: 14,
                                  color: Colors.grey,
                                  font: FontWeight.normal,
                                  alignment: Alignment.topLeft,
                                ),
                                TextFormField(
                                  controller: controller.state,
                                  decoration: const InputDecoration(
                                    hintText: 'Lagos State',
                                    hintStyle: TextStyle(
                                        fontSize: 18, color: Colors.black12),
                                  ),
                                  keyboardType: TextInputType.streetAddress,
                                  onSaved: (String? value) {
                                    controller.State = value;
                                  },
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Your State is not correct.';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                CustomText(
                                  text: 'Country',
                                  size: 14,
                                  color: Colors.grey,
                                  font: FontWeight.normal,
                                  alignment: Alignment.topLeft,
                                ),
                                TextFormField(
                                  controller: controller.country,
                                  decoration: const InputDecoration(
                                    hintText: 'Nigeria',
                                    hintStyle: TextStyle(
                                        fontSize: 18, color: Colors.black12),
                                  ),
                                  keyboardType: TextInputType.streetAddress,
                                  onSaved: (String? value) {
                                    controller.Country = value;
                                  },
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Your Country is not correct.';
                                    }
                                    return null;
                                  },
                                ),
                              ],
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
      ),
    );
  }
}
