import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:techblog/views/other/splash_screen.dart';
import '../views/article/article_content.dart';
import '../views/article/article_manager.dart';
import '../views/article/article_preview.dart';
import '../views/article/article_screen.dart';
import '../views/main/home_screen.dart';
import '../views/main/main_screen.dart';
import '../views/main/profile_screen.dart';
import 'bindings.dart';
import '../views/other/onboard_screen.dart';
import '../views/podcast/podcast_content.dart';
import '../views/register/register_intro.dart';

class RouteManagement {
  RouteManagement._();
  static List<GetPage<dynamic>> list = [
    GetPage(
      name: initialRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: routeHomeScreen,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: routeMainScreen,
      page: () => MainScreen(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: routeProfileScreen,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: routeArticleScreen,
      page: () => ArticleScreen(),
      binding: ArticleScreenBinding(),
    ),
    GetPage(
      name: routeArticleContent,
      page: () => ArticleContent(),
      binding: ArticleContentBinding(),
    ),
    GetPage(
      name: routeArticleManager,
      page: () => ArticleManagerScreen(),
      binding: ArticleContentBinding(),
    ),
    GetPage(
      name: routeArticlePreview,
      page: () => ArticlePreview(),
      binding: ArticlePreviewBindings(),
    ),
    GetPage(
      name: routeRegisterIntroScreen,
      page: () => RegisterIntro(),
      binding: RegisterIntroBindings(),
      curve: Curves.bounceIn,
    ),
    GetPage(
      name: routePodcastContent,
      page: () => PodcastContent(),
    ),
    GetPage(
      name: routeOnBoardScreen,
      page: () => OnBoardScreen(),
    ),
  ];
}

String initialRoute = "/";
String routeHomeScreen = "/HomeScreen";
String routeMainScreen = "/MainScreen";
String routeProfileScreen = "/ProfileScreen";
String routeArticleScreen = "/ArticleScreen";
String routeArticleContent = "/ArticleContent";
String routeArticleManager = "/ArticleManager";
String routeArticlePreview = "/ArticlePreview";
String routeRegisterIntroScreen = "/RegisterIntroScreen";
String routePodcastContent = "/PodcastContent";
String routeOnBoardScreen = "/OnBoardScreen";
