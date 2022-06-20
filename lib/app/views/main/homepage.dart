import 'dart:convert';

import 'package:bondhu_charity/app/controllers/auth_controller.dart';
import 'package:bondhu_charity/app/models/post_model.dart';
import 'package:bondhu_charity/app/utils/navigate.dart';
import 'package:bondhu_charity/app/views/main/add_post_screen.dart';
import 'package:bondhu_charity/app/views/main/details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    final _firestore = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'সেবা সংঘ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      drawer: DrawerWidget(authController: authController),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('posts').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final data = snapshot.data!.docs;
                  if (data.isEmpty) {
                    return const Center(
                      child: Text(
                        '\n\n\n\n\n\n\n\n\n\n\n\n\n\nNothing to show',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: data.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final post = PostModel.fromJson(
                              data[index].data() as Map<String, dynamic>);

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: SizedBox(
                              height: 100,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                                color: Colors.teal,
                                child: ListTile(
                                  onTap: () {
                                    push(
                                      context: context,
                                      widget: DetailsPage(
                                        title: post.title.toString(),
                                        body: post.body.toString(),
                                        amount: post.amount.toString(),
                                        paymentMethod:
                                            post.paymentMethod.toString(),
                                      ),
                                    );
                                  },
                                  title: Text(
                                    post.title.toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                  ),
                                  subtitle: Text(
                                    post.body.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black38,
                                    ),
                                    maxLines: 2,
                                  ),
                                  // trailing: Text(
                                  //   '${formatCurrency.format(int.parse(post.amount.toString())).replaceAll('\$', '')} টাকা',
                                  //   style: const TextStyle(
                                  //     fontSize: 18,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  AlertDialog openAlertBox(context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      content: SizedBox(
        width: 400.0,
        height: 450.0,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'নতুন সমস্যা যোগ করুন',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'সমস্যা লিখুন',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  maxLines: 1,
                  maxLength: 30,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'সমস্যা লিখুন',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              Text(
                'সমস্যার বিস্তারিত লিখুন',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  maxLines: 4,
                  maxLength: 150,
                  decoration: InputDecoration(
                    hintText: 'সমস্যার বিস্তারিত লিখুন',
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              Text(
                'টাকার পরিমান লিখুন',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'টাকার পরিমান লিখুন',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 20 * 3,
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32.0),
                        bottomRight: Radius.circular(32.0)),
                  ),
                  child: Text(
                    "Rate Product",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
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
