import 'package:bondhu_charity/app/views/auth/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/main/homepage.dart';

class AuthController extends GetxController {
  bool isVisible = false;
  bool obscureText = false;

  void toggleVisibility() {
    isVisible = !isVisible;
    obscureText = !obscureText;
    update();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
// user type

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createAccount() async {
    final user = await _auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    final firestore = FirebaseFirestore.instance;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userType = prefs.getString('userType');
    firestore.collection('users').doc(user.user!.uid).set({
      "email": emailController.text,
      "password": passwordController.text,
      "type": userType,
    });
    if (user != null) {
      print('User Created');
      Get.to(LoginScreenView());
    } else {
      print('error');
    }
  }

  Future<void> loginUser() async {
    final user = await _auth.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text);
    if (user != null) {
      // lets save user with shared prefrences

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userID", user.user!.uid);
      print(user.user!.uid);
      Get.to(HomePage());
    } else {
      print('error');
    }
  }

  // Let's make a function for logout

  Future<void> logoutUser() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(LoginScreenView());
  }
}
