import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/post_controller.dart';
import '../views/main/add_post_screen.dart';
import '../views/main/my_post_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
    required this.authController,
  }) : super(key: key);

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    final postController = Get.put(PostController());
    return GetBuilder<PostController>(builder: (cont) {
      return Drawer(
        child: ListView(
          children: [
            Center(
              child: Image.asset(
                'assets/icons/love.png',
                width: MediaQuery.of(context).size.width / 2.2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/home.png',
                width: 25,
                height: 25,
                color: Colors.white,
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.dashboard,
                color: Colors.white,
                size: 25,
              ),
              title: const Text('My Posts',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )),
              onTap: () {
                cont.myPosts.isEmpty
                    ? Get.snackbar(
                        'No Posts',
                        'You have no posts yet',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 2),
                      )
                    : Get.to(() => const MyPostsScreen());
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/heart.png',
                width: 25,
                height: 25,
                color: Colors.white,
              ),
              title: const Text('Add Post',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddPostScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/heart.png',
                width: 25,
                height: 25,
                color: Colors.white,
              ),
              title: const Text('About Us',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AboutDialog(
                    applicationIcon: Image.asset(
                      'assets/icons/love.png',
                      width: MediaQuery.of(context).size.width / 2.2,
                    ),
                    applicationName: 'Seba Sangha',
                    children: [
                      Text(
                        'This is a simple app that I made to learn how to use Flutter.',
                      ),
                      Text(
                        'I hope you enjoy it!',
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Colors.red,
                size: 25,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                authController.logoutUser();
              },
            ),
          ],
        ),
      );
    });
  }
}
