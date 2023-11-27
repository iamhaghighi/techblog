import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';

import 'package:techblog/views/main/home_screen.dart';
import 'package:techblog/views/main/profile_screen.dart';

// when you are in profileScreen and click hot reload, going to homeScreen.
// for fix that: convert to statefulWidget
class MainScreen extends StatelessWidget {
  MainScreen({
    super.key,
  });
  final RxInt selectedIndexed = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              IndexedStack(
                index: selectedIndexed.value,
                children: [
                  const HomeScreen(),
                  ProfileScreen(),
                ],
              ),
              BottomNavigation(
                changeScreenIndex: Rx(selectedIndexed.call),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
