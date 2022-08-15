// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:shop_app/core/services/fire_store_user.dart';
import 'package:shop_app/helper/local_storage_data.dart';
import 'package:shop_app/model/user_model.dart';
import 'package:shop_app/view/auth/login_screen.dart';
import 'package:shop_app/view/controller.dart';
import 'package:twitter_login/twitter_login.dart';

class ViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FacebookLogin _facebookauth = FacebookLogin();
  final twitterLogin = TwitterLogin(
    apiKey: 'bLp8WGUjv2w6770NFk2U34X51',
    apiSecretKey: 'et0fOqyMYUqVyritGzUitnhVqvpvurB19grFvkZmNxeWsnZnUx',
    redirectURI: 'flutter-twitter-login://',
  );

  late String email, password, name;

  final Rx<User?> _user = Rx<User?>(null);
  String? get user => _user.value?.email;

  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
  
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser != null){
      getCurrentData(_auth.currentUser!.uid);
    }
  }


  void googleSignInMethod() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleSignInAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(const ControlView());
    });
  }

  void signInWithFacebook() async {
    final FacebookLoginResult loginResult = await _facebookauth.logIn();

    if (loginResult.status == FacebookLoginStatus.success) {
      final facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          .then((user) {
        saveUser(user);
        Get.offAll(const ControlView());
      });
    }
  }

  Future<Resource?> signInWithTwitter() async {
    final authResult = await twitterLogin.login();

    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        final AuthCredential twitterAuthCredential =
            TwitterAuthProvider.credential(
                accessToken: authResult.authToken!,
                secret: authResult.authTokenSecret!);

        // ignore: unused_local_variable
        final userCredential = await _auth
            .signInWithCredential(twitterAuthCredential)
            .then((user) {
          saveUser(user);
          Get.offAll(const ControlView());
        });
        return Resource(status: Status.Success);
      case TwitterLoginStatus.cancelledByUser:
        return Resource(status: Status.Success);
      case TwitterLoginStatus.error:
        return Resource(status: Status.Error);
      default:
        return null;
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        getCurrentData(value.user!.uid);
      });
      Get.offAll(const ControlView());
    } catch (e) {
      Get.snackbar(
        "Error login account",
        '$e',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void creatAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(LogInScreen());
    } catch (e) {
      Get.snackbar(
        "Error login account",
        '$e',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      // ignore: prefer_if_null_operators, unnecessary_null_comparison
      name: name == null ? user.user!.displayName : name,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }

  void getCurrentData(String uid) async {
  await FireStoreUser().getCurrentUser(uid).then((value) {
    setUser(UserModel.fromJson(value.data() as Map<dynamic, dynamic>));
  });
}

}


class Resource {
  final Status status;
  Resource({required this.status});
}

enum Status { Success, Error, Cancelled }
