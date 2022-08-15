// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shop_app/view/widgets/custom_text.dart';

// ignore: must_be_immutable
class CustomButtom extends StatelessWidget {
  CustomButtom({
    Key? key,
    required this.text,
    this.onPressed,
    required this.alignment,
    this.border = 10,
  }) : super(key: key);
  String text = '';
  double? border = 10;
  Alignment alignment = Alignment.center;
  Function()? onPressed = () {};
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(15),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(border as double),
      ),
      color: const Color.fromRGBO(0, 197, 105, 1),
      child: CustomText(
        text: text,
        color: Colors.white,
        size: 14,
        font: FontWeight.normal,
        alignment: alignment,
      ),
    );
  }
}
