import 'package:bondhu_charity/app/controllers/post_controller.dart';
import 'package:get/get.dart';

import 'app/controllers/auth_controller.dart';

abstract class Dic {
  static final find = Get.find;

  static Future<void> setUp() async {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => PostController());
  }
}
