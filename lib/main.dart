import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/gestures.dart';
import 'package:techblog/views/article/article_manager.dart';
import 'package:techblog/views/article/article_preview.dart';
import 'package:techblog/views/register/register_intro.dart';
import 'package:techblog/views/article/article_screen.dart';
import 'package:techblog/views/main/home_screen.dart';
import 'package:techblog/views/main/main_screen.dart';
import 'package:techblog/views/main/profile_screen.dart';
import 'package:techblog/views/other/bindings.dart';
import 'package:techblog/views/other/onboard_screen.dart';
import 'views/article/article_content.dart';

void main() async {
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('fa', 'IR'),
      theme: ThemeData(
        fontFamily: 'dana',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
              AppColors.primaryColor,
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
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
          name: routeOnBoardScreen,
          page: () => OnBoardScreen(),
        ),
      ],
      home: MainScreen(),
    );
  }
}

String routeHomeScreen = "/HomeScreen";
String routeMainScreen = "/MainScreen";
String routeProfileScreen = "/ProfileScreen";
String routeArticleScreen = "/ArticleScreen";
String routeArticleContent = "/ArticleContent";
String routeArticleManager = "/ArticleManager";
String routeArticlePreview = "/ArticlePreview";
String routeOnBoardScreen = "/OnBoardScreen";
String routeRegisterIntroScreen = "/RegisterIntroScreen";
