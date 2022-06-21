import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController paymentMethodController = TextEditingController();
  String? selectedMethod;
  // dropdown
  final List<String> paymentMethods = ['বিকাশ', 'নগদ', 'রকেট'];
  final List<String> paymentMethodImages = [
    'assets/icons/bkash.png',
    'assets/icons/nagad.png',
    'assets/icons/rocket.png'
  ];
  void dropdownMethod(String value) {
    selectedMethod = value;
    update();
  }

  Future createPost() async {
    final firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;
    firestore.collection('posts').add({
      "title": titleController.text,
      "body": bodyController.text,
      "amount": amountController.text,
      "paymentMethodNumber": paymentMethodController.text,
      "userID": user!.uid,
      "paymentMethod": selectedMethod,
    }).then((value) {
      Get.snackbar(
        "Success",
        "Post Created Successfully",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      titleController.clear();
      bodyController.clear();
      amountController.clear();
      paymentMethodController.clear();
    });
  }

// my posts
  List myPosts = [];
  // get my posts
  Future getMyPosts() async {
    final firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;
    final snapshot = await firestore
        .collection('posts')
        .where('userID', isEqualTo: user!.uid)
        .get();
    for (var doc in snapshot.docs) {
      final post = doc.data();
      myPosts.add(post);
      update();
      print(myPosts.length);
    }
  }

// delete my post by id
  Future deletePost(String id) async {
    final firestore = FirebaseFirestore.instance;
    firestore.collection('posts').doc(id).delete();
  }

  @override
  void onInit() {
    super.onInit();
    getMyPosts();
  }
}
