import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/gestures.dart';
import 'package:techblog/views/article/article_screen.dart';
import 'package:techblog/views/main/home_screen.dart';
import 'package:techblog/views/main/main_screen.dart';
import 'package:techblog/views/main/profile_screen.dart';
import 'package:techblog/views/other/bindings.dart';
import 'package:techblog/views/other/onboard_screen.dart';

import 'views/article/article_content.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('fa', 'IR'),
      theme: ThemeData(fontFamily: 'dana'),
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      initialBinding: ArticleContentBinding(),
      getPages: [
        GetPage(
          name: routeHomeScreen,
          page: () => HomeScreen(),
          binding: HomeScreenBinding(),
        ),
        GetPage(
          name: routeArticleScreen,
          page: () => ArticleScreen(),
          binding: ArticleScreenBinding(),
        ),
        GetPage(
          name: routeMainScreen,
          page: () => MainScreen(),
          binding: MainScreenBinding(),
        ),
        GetPage(
          name: routeOnBoardScreen,
          page: () => OnBoardScreen(),
        ),
        GetPage(
          name: routeProfileScreen,
          page: () => ProfileScreen(),
        ),
        GetPage(
          name: routeArticleContent,
          page: () => ArticleContent(),
          binding: ArticleContentBinding(),
        )
      ],
      home: MainScreen(),
    );
  }
}

String routeMainScreen = "/MainScreen";
String routeArticleScreen = "/ArticleScreen";
String routeOnBoardScreen = "/OnBoardScreen";
String routeHomeScreen = "/HomeScreen";
String routeProfileScreen = "/ProfileScreen";
String routeArticleContent = "/ArticleContent";
