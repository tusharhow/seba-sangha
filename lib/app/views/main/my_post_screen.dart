import 'package:bondhu_charity/app/controllers/post_controller.dart';
import 'package:bondhu_charity/app/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class MyPostsScreen extends StatelessWidget {
  const MyPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          title: const Text(
            'My Posts',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: GetBuilder<PostController>(builder: (cont) {
          return Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: cont.myPosts.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final post = cont.myPosts[index];
                    return SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Card(
                        color: Colors.white24,
                        child: ListTile(
                          title: Text(
                            post['title'].toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              post['body'].toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          );
        })));
  }
}
