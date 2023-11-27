import 'package:get/get.dart';
import 'package:techblog/controllers/article/article_screen_controller.dart';
import 'package:techblog/controllers/main/home_screen_controller.dart';
import 'package:techblog/controllers/main/main_screen_controller.dart';
import 'package:techblog/controllers/main/profile_screen_controller.dart';

class HomeScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }
}


class MainScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MainScreenController());
  }
}

class ProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileScreenController());
  }
}

class ArticleScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticleScreenController());
  }
}

