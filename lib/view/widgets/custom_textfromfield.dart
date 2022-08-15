// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  CustomTextFromField(
      {Key? key,
      required this.controller,
      required this.hint,
      required this.obscureText,
      required this.keyboard,
      required this.onSaved,
      required this.validator})
      : super(key: key);
  var controller = TextEditingController();
  // ignore: prefer_function_declarations_over_variables
  String? Function(String? value) validator = (String? value) {};
  // ignore: prefer_function_declarations_over_variables
  var onSaved = (String? value) {};
  TextInputType keyboard = TextInputType.text;
  String hint = '';
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 18,color: Color.fromARGB(255, 92, 91, 91)),
        labelStyle: const TextStyle(color: Colors.black),
      ),
      keyboardType: keyboard,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
    );
  }
}
