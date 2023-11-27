// TODO: splash screen
// TODO: change FakeModelView
// TODO: binding and Controller for views
// TODO: dynamic onBoard
// TODO: drawer

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/gestures.dart';
import 'package:techblog/onBoard/onboard_screen.dart';
import 'package:techblog/splash_screen.dart';
import 'package:techblog/views/article/article_screen.dart';
import 'package:techblog/views/main/main_screen.dart';

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
      getPages: [
        GetPage(
          name: routeArticleScreen,
          page: () => const ArticleScreen(),
        ),
        GetPage(
          name: routeMainScreen,
          page: () => MainScreen(),
        ),
        GetPage(
          name: routeOnBoardScreen,
          page: () => OnBoardScreen(),
        ),
      ],
      home: OnBoardScreen(),
    );
  }
}

String routeMainScreen = "/MainScreen";
String routeArticleScreen = "/ArticleScreen";
String routeOnBoardScreen = "/OnBoardScreen";
