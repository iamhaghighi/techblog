import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/controllers/register/register_intro_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  RegisterIntro({super.key});

  final RegisterIntroController registerManagerController = Get.put(
    RegisterIntroController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.bot.image(scale: 10),
            Text(
              "به تک بلاگ خوش اومدی",
              style: AppTextStyle.heading1(
                color: AppColors.defaultColorBlack,
              ),
            ),
            const SizedBox(height: AppSize.defaultBetweenWidth),
            SizedBox(
              width: 250,
              child: Text(
                "به تک‌بلاگ خوش اومدی برای ارسال مطلب و پادکست باید حتما ثبت نام کنی.",
                style: AppTextStyle.heading2(
                  color: AppColors.defaultColorBlack,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: AppSize.defaultBodyHeight + 50,
            ),
            ElevatedButton(
              onPressed: () {
                emailBottomSheet(context);
              },
              child: Text(
                "بزن بریم",
                style: AppTextStyle.heading1(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> emailBottomSheet(BuildContext context) {
    return Get.bottomSheet(
      Container(
        height: Get.height / 3,
        width: Get.width / 1,
        decoration: const BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.defaultBorderRadius + 5),
            topRight: Radius.circular(AppSize.defaultBorderRadius + 5),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "لطفا ایمیلتون رو وارد کنید",
              style: AppTextStyle.heading1(
                color: AppColors.defaultColorBlack,
              ),
            ),
            const SizedBox(height: AppSize.defaultBetweenWidth + 5),
            SizedBox(
              width: Get.width / 1.3,
              height: Get.height / 19,
              child: TextField(
                controller: registerManagerController
                    .registerEmailTextEditingController,
                onSubmitted: (value) {
                  Navigator.pop(context);
                  activeCodeBottomSheet();
                },
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.go,
                style: AppTextStyle.heading1(
                  color: AppColors.defaultColorBlack,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  hintText: "برای مثال: iamhaghighi@gmail.com",
                  hintStyle: AppTextStyle.heading2(
                    color: AppColors.hintColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const EdgeInsets.only(right: 10, left: 10),
                ),
              ),
            ),
            SizedBox(
              height: AppSize.defaultBodyHeight,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                activeCodeBottomSheet();
                registerManagerController.registerEmail();
              },
              child: Text(
                "بعدی",
                style: AppTextStyle.heading1(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> activeCodeBottomSheet() {
    return Get.bottomSheet(
      Container(
        height: Get.height / 3,
        width: Get.width / 1,
        decoration: const BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.defaultBorderRadius + 5),
            topRight: Radius.circular(AppSize.defaultBorderRadius + 5),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "کد فعالسازی رو وارد کنید",
              style: AppTextStyle.heading1(
                color: AppColors.defaultColorBlack,
              ),
            ),
            const SizedBox(height: AppSize.defaultBetweenWidth + 5),
            SizedBox(
              width: Get.width / 1.3,
              height: Get.height / 19,
              child: TextField(
                controller:
                    registerManagerController.verifyCodeTextEditingController,
                onSubmitted: (value) {},
                style: AppTextStyle.heading1(
                  color: AppColors.defaultColorBlack,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "******",
                  hintStyle: AppTextStyle.heading2(
                    color: AppColors.hintColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  contentPadding: const EdgeInsets.only(right: 10, left: 10),
                ),
              ),
            ),
            SizedBox(
              height: AppSize.defaultBodyHeight,
            ),
            ElevatedButton(
              onPressed: () {
                registerManagerController.verifyCode();
              },
              child: Text(
                "بعدی",
                style: AppTextStyle.heading1(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
