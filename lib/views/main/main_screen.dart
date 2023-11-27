import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/controllers/main/home_screen_controller.dart';
import 'package:techblog/controllers/main/main_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';

import 'package:techblog/views/main/home_screen.dart';
import 'package:techblog/views/main/profile_screen.dart';

// when you are in profileScreen and click hot reload, going to homeScreen.
// for fix that: convert to statefulWidget
class MainScreen extends StatelessWidget {
  MainScreen({
    super.key,
  });

  // change main screenController to Get.find when change to splashScreen in main.dart
  final MainScreenController mainScreenController = Get.put(
    MainScreenController(),
  );

  final HomeScreenController homeScreenController = Get.put(
    HomeScreenController(),
  );

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    homeScreenController.key = _key;
    return Scaffold(
      key: _key,
      backgroundColor: AppColors.bg,
      drawer: Drawer(
        width: 250,
        backgroundColor: AppColors.bg,
        child: ListView(
          children: [
            Assets.icons.logoPng.image(
              scale: Get.height / 300,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "پروفایل کاربری",
                      style: AppTextStyle.heading2(
                        color: AppColors.defaultColorBlack,
                      ),
                    ),
                    onTap: () {
                      Get.toNamed(routeProfileScreen);
                    },
                  ),
                  const Divider(
                    endIndent: 20,
                    indent: 20,
                    color: AppColors.divider,
                  ),
                  ListTile(
                    title: Text(
                      "درباره تک بلاگ",
                      style: AppTextStyle.heading2(
                        color: AppColors.defaultColorBlack,
                      ),
                    ),
                  ),
                  const Divider(
                    endIndent: 20,
                    indent: 20,
                    color: AppColors.divider,
                  ),
                  ListTile(
                    title: Text(
                      "تک بلاگ در وبسایت",
                      style: AppTextStyle.heading2(
                        color: AppColors.defaultColorBlack,
                      ),
                    ),
                  ),
                  const Divider(
                    endIndent: 20,
                    indent: 20,
                    color: AppColors.divider,
                  ),
                  ListTile(
                    title: Text(
                      "اشتراک گذاری تک بلاگ",
                      style: AppTextStyle.heading2(
                        color: AppColors.defaultColorBlack,
                      ),
                    ),
                  ),
                  const Divider(
                    endIndent: 20,
                    indent: 20,
                    color: AppColors.divider,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              IndexedStack(
                index: mainScreenController.selectedIndexed.value,
                children: [
                  HomeScreen(),
                  ProfileScreen(),
                ],
              ),
              BottomNavigation(
                changeScreenIndex: Rx(
                  mainScreenController.selectedIndexed.call,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
