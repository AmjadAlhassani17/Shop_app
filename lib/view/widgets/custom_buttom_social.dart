// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shop_app/view/widgets/custom_text.dart';

// ignore: must_be_immutable
class CustomButtomSocial extends StatelessWidget {
  CustomButtomSocial({
    Key? key,
    required this.text,
    this.onPressed,
    required this.alignment,
    required this.image,
  }) : super(key: key);
  String text = '';
  String image = '';
  Alignment alignment = Alignment.center;
  Function()? onPressed = () {};
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(15),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.grey)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(image),
          CustomText(
            text: text,
            color: Colors.black,
            size: 14,
            font: FontWeight.normal,
            alignment: alignment,
          ),
        ],
      ),
    );
  }
}
