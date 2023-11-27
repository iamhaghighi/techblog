import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/bindings.dart';
import 'package:techblog/components/gestures.dart';
import 'package:techblog/onboard_screen.dart';
import 'package:techblog/views/article/article_screen.dart';
import 'package:techblog/views/main/home_screen.dart';
import 'package:techblog/views/main/main_screen.dart';
import 'package:techblog/views/main/profile_screen.dart';

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
          name: routeHomeScreen,
          page: () => HomeScreen(),
          binding: HomeScreenBindings(),
        ),
        GetPage(
          name: routeArticleScreen,
          page: () => ArticleScreen(),
          binding: ArticleScreenBindings()
        ),
        GetPage(
          name: routeMainScreen,
          page: () => MainScreen(),
          binding: MainScreenBindings()
        ),
        GetPage(
          name: routeOnBoardScreen,
          page: () => OnBoardScreen(),
        ),
        GetPage(
          name: routeProfileScreen,
          page: () => ProfileScreen(),
        ),
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
