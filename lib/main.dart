// TODO: dynamic author and view
// TODO: Make a Tags dynamcic
// TODO: print list.lenght - 1
// TODO: splash screen

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/gestures.dart';
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
      ],
      home: MainScreen(),
    );
  }
}

String routeArticleScreen = "/ArticleScreen";