// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/auth_view_model.dart';
import 'package:shop_app/view/auth/sign_up.dart';
import 'package:shop_app/view/widgets/custom_buttom.dart';
import 'package:shop_app/view/widgets/custom_buttom_social.dart';
import 'package:shop_app/view/widgets/custom_text.dart';
import 'package:shop_app/view/widgets/custom_textfromfield.dart';

class LogInScreen extends GetWidget<ViewModel> {
  LogInScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          left: 15,
          right: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              alignment: Alignment.topLeft,
                              text: "Welcome,",
                              size: 30,
                              color: Colors.black,
                              font: FontWeight.bold),
                          GestureDetector(
                            onTap: () => Get.to(SignUp()),
                            child: CustomText(
                                alignment: Alignment.topLeft,
                                text: "Sign Up",
                                size: 18,
                                color: const Color.fromRGBO(0, 197, 105, 1),
                                font: FontWeight.normal),
                          )
                        ],
                      ),
                      CustomText(
                          alignment: Alignment.topLeft,
                          text: "Sign in to Continue",
                          size: 14,
                          color: const Color.fromRGBO(146, 146, 146, 1),
                          font: FontWeight.normal),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: CustomText(
                            text: 'Forgot Password?',
                            size: 14,
                            color: Colors.black,
                            font: FontWeight.normal,
                            alignment: Alignment.topRight),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButtom(
                        text: 'SIGN IN',
                        alignment: Alignment.center,
                        onPressed: () {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            controller.signInWithEmailAndPassword();
                          }
                        }, border: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                  text: '-OR-',
                  size: 18,
                  color: Colors.black,
                  font: FontWeight.normal,
                  alignment: Alignment.center),
              const SizedBox(
                height: 20,
              ),
              CustomButtomSocial(
                  image: 'assetss/imagee/icons8_Google_2.png',
                  text: 'Sign In with Google',
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
                  alignment: Alignment.center),
              const SizedBox(
                height: 10,
              ),
              CustomButtomSocial(
                  image: 'assetss/imagee/Icon_Facebook.png',
                  text: 'Sign In with Facebook',
                  onPressed: () {
                    controller.signInWithFacebook();
                  },
                  alignment: Alignment.center),
              const SizedBox(
                height: 10,
              ),
              CustomButtomSocial(
                  image: 'assetss/imagee/icons8-twitter-squared-24.png',
                  text: 'Sign In with Twitter',
                  onPressed: () {
                    controller.signInWithTwitter();
                  },
                  alignment: Alignment.center),
            ],
          ),
        ),
      ),
    );
  }
}
