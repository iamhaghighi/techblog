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
    Get.lazyPut(() => HomeScreenController());
  }
}

class MainScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenController());
  }
}

class ProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileScreenController());
  }
}

class ArticleScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleScreenController());
  }
}

class ArticleContentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => (ArticleContentController));
  }
}

class ArticleManagerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => (ArticleManagerController));
  }
}

class ArticlePreviewBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => (ArticlePreviewController));
  }
}

class RegisterIntroBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => (RegisterIntroController));
  }
}
