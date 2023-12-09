import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/gestures.dart';
import 'package:techblog/rout_management/route_management.dart';
import 'package:techblog/rout_management/bindings.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  await GetStorage.init();
  runApp(const MainApp());

  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(330, 650));
    WindowManager.instance.setMaximumSize(const Size(790, 720));
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      locale: const Locale('fa', 'IR'),
      theme: themeData(),
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      initialBinding: ArticleContentBinding(),
      getPages: RouteManagement.list,
    );
  }

  ThemeData themeData() {
    return ThemeData(
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
    );
  }
}
