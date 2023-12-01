import 'package:get/get.dart';
import 'package:techblog/controllers/article/article_manager_controller.dart';
import 'package:techblog/controllers/article/article_preview_controller.dart';
import 'package:techblog/controllers/article/article_screen_controller.dart';
import 'package:techblog/controllers/main/home_screen_controller.dart';
import 'package:techblog/controllers/main/main_screen_controller.dart';
import 'package:techblog/controllers/main/profile_screen_controller.dart';
import 'package:techblog/controllers/register/register_intro_screen_controller.dart';

import '../../controllers/article/article_content_controller.dart';

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }
}

class MainScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainScreenController());
  }
}

class ProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileScreenController());
  }
}

class ArticleScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticleScreenController());
  }
}

class ArticleContentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put((ArticleContentController));
  }
}

class RegisterIntroScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put((RegisterIntroScreenController));
  }
}

class ArticleManagerBindings implements Bindings {
  @override
  void dependencies() {
    Get.put((ArticleManagerController));
  }
}

class ArticlePreviewBindings implements Bindings {
  @override
  void dependencies() {
    Get.put((ArticlePreviewController));
  }
}

