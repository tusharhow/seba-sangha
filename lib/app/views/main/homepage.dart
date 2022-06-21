import 'package:bondhu_charity/app/controllers/auth_controller.dart';
import 'package:bondhu_charity/app/models/post_model.dart';
import 'package:bondhu_charity/app/utils/navigate.dart';
import 'package:bondhu_charity/app/views/main/details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                                color: Colors.indigo.shade400,
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
                                        paymentMethodNumber:
                                            post.paymentMethodNumber.toString(),
                                      ),
                                    );
                                  },
                                  title: Text(
                                    post.title.toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    maxLines: 2,
                                  ),
                                  subtitle: Text(
                                    post.body.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white70,
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
}
