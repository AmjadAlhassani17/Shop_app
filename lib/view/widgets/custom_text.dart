import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText({
    Key? key,
    required this.text,
    required this.size,
    required this.color,
    required this.font,
    required this.alignment,
    this.height
  }) : super(key: key);
  String text = '';
  double size = 10;
  Color color = Colors.black;
  double? height = 0;
  FontWeight font = FontWeight.normal;
  Alignment alignment = Alignment.topLeft;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size ,
          height: height,
          fontWeight: font,
        ),
      ),
    );
  }
}
