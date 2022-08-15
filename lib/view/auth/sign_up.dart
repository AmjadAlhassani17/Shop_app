import 'package:get/get.dart';
import 'package:shop_app/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/view/auth/login_screen.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfromfield.dart';

class SignUp extends GetWidget<ViewModel> {
  SignUp({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 250, 250, 250),
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () => Get.to(LogInScreen()),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 15,
          right: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 490,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      CustomText(
                          alignment: Alignment.topLeft,
                          text: "Sign Up",
                          size: 30,
                          color: Colors.black,
                          font: FontWeight.bold),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: 'Name',
                                size: 14,
                                color: Colors.grey,
                                font: FontWeight.normal,
                                alignment: Alignment.topLeft),
                            CustomTextFromField(
                              controller: nameController,
                              hint: 'David Spade',
                              keyboard: TextInputType.emailAddress,
                              obscureText: false,
                              onSaved: (String? value) {
                                controller.name = value!;
                              },
                              validator: (String? value) {
                                if (value != null && value.isEmpty) {
                                  return 'Your Name is not correct.';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomText(
                                text: 'Email',
                                size: 14,
                                color: Colors.grey,
                                font: FontWeight.normal,
                                alignment: Alignment.topLeft),
                            CustomTextFromField(
                              controller: emailController,
                              hint: 'iamdavid@gmail.com',
                              keyboard: TextInputType.emailAddress,
                              obscureText: false,
                              onSaved: (String? value) {
                                controller.email = value!;
                              },
                              validator: (String? value) {
                                if (value != null && !value.contains('@') ||
                                    !value!.contains('.com')) {
                                  return 'Your email is not correct.';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomText(
                                text: 'Password',
                                size: 14,
                                color: Colors.grey,
                                font: FontWeight.normal,
                                alignment: Alignment.topLeft),
                            CustomTextFromField(
                              controller: passwordController,
                              hint: '* * * * * * *',
                              keyboard: TextInputType.visiblePassword,
                              onSaved: (String? value) {
                                controller.password = value!;
                              },
                              obscureText: true,
                              validator: (String? value) {
                                return (value != null && (value.length < 6))
                                    ? 'Password is empty or very short.'
                                    : null;
                              },
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomButtom(
                        text: 'SIGN UP',
                        alignment: Alignment.center,
                        onPressed: () {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            controller.creatAccountWithEmailAndPassword();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
