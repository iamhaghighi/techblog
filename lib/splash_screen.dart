import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) {
        Get.offAndToNamed(routeOnBoardScreen);
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.logo.image(scale: 4),
              SizedBox(height: AppSize.bodyHeight - 10),
              const SpinKitFadingCube(
                color: AppColors.primaryColor,
                size: 13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
