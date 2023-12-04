import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/controllers/main/home_screen_controller.dart';
import 'package:techblog/controllers/main/main_screen_controller.dart';
import 'package:techblog/controllers/register/register_intro_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';

import 'package:techblog/views/main/home_screen.dart';
import 'package:techblog/views/main/profile_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    super.key,
  });

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

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    super.key,
    required this.changeScreenIndex,
  });

  final Rx<int Function(int)> changeScreenIndex;
  final mainScreenController = Get.find<MainScreenController>();
  final registerIntroScreenController = Get.put(RegisterIntroController());
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.quaternaryColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.navBottomShadow,
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        height: 65,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 3, 15, 0),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    mainScreenController.iconStates.value = [
                      true,
                      false,
                      false
                    ];
                    changeScreenIndex.value(0);
                    ;
                  },
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          mainScreenController.iconStates[0]
                              ? Assets.icons.homeBold.path
                              : Assets.icons.home.path,
                          color: AppColors.defaultColorWhite,
                        ),
                        Text(
                          "خانه",
                          style: AppTextStyle.heading2(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    mainScreenController.iconStates.value = [
                      false,
                      true,
                      false
                    ];
                    registerIntroScreenController.checkLogin();
                  },
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          mainScreenController.iconStates[1]
                              ? Assets.icons.editBold.path
                              : Assets.icons.edit.path,
                          color: AppColors.defaultColorWhite,
                        ),
                        Text(
                          "مقاله نویسی",
                          style: AppTextStyle.heading2(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    mainScreenController.iconStates.value = [
                      false,
                      false,
                      true
                    ];
                    changeScreenIndex.value(1);
                  },
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          mainScreenController.iconStates[2]
                              ? Assets.icons.profileBold.path
                              : Assets.icons.profile.path,
                          color: AppColors.defaultColorWhite,
                        ),
                        Text(
                          "پروفایل",
                          style: AppTextStyle.heading2(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
