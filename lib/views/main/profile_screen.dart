import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/controllers/file_picker_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/services/file_picker.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final FilePickerController filePickerController = Get.put(
    FilePickerController(),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSize.bodyPaddingLeft,
          AppSize.bodyPaddingTop,
          AppSize.bodyPaddingRight,
          0,
        ),
        child: Column(
          children: [
            // appBar
            appBar(
              leftSvgIcon: Assets.icons.left2.path,
              leftText: "بازگشت",
              leftSvgIconTextWidth: 1,
              rightSvgIcon: Assets.icons.menuKebab.path,
              rightSvgIconHeight: 20,
            ),
            SizedBox(height: AppSize.bodyHeight),
            // profile
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: AppGradient.profileScreenBorderGradient,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: <double>[0.1, 0.7],
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.bg,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Obx(
                        () => ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child:
                              filePickerController.file.value.name != 'nothing'
                                  ? Image.file(
                                      File(
                                        filePickerController.file.value.path!,
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                  : Assets.images.blog3.image(
                                      fit: BoxFit.cover,
                                    ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      filePicker();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.bg,
                          width: 2.5,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      ),
                      child: Assets.icons.addPhotoPng.image(
                        color: AppColors.defaultColorWhite,
                        scale: 1.6,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: AppSize.bodyHeight - 20),
            // profile name and email
            Column(
              children: [
                Text(
                  "محمد حقیقی",
                  style: AppTextStyle.heading1(
                    color: Colors.black,
                  ),
                ),
                Text(
                  "iamhaghighi@gmail.com",
                  style: AppTextStyle.heading1(
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(height: AppSize.bodyHeight - 10),
            // Setting Container
            Container(
              decoration: BoxDecoration(
                color: AppColors.defaultColorWhite,
                borderRadius: BorderRadius.circular(
                  AppSize.borderRadius,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.profileSettingBoxShadow,
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Assets.icons.edit2.path),
                            const SizedBox(width: AppSize.betweenWidgetWidth),
                            Text(
                              "ویرایش پروفایل",
                              style: AppTextStyle.heading2(
                                color: AppColors.defaultColorBlack,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SvgPicture.asset(Assets.icons.left1.path)
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Divider(
                        endIndent: 30,
                        indent: 30,
                        color: Color.fromARGB(100, 172, 169, 191),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Assets.icons.password.path),
                            const SizedBox(width: AppSize.betweenWidgetWidth),
                            Text(
                              "تغییر دادن رمز عبور",
                              style: AppTextStyle.heading2(
                                color: AppColors.defaultColorBlack,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(Assets.icons.left1.path)
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Divider(
                        endIndent: 30,
                        indent: 30,
                        color: Color.fromARGB(100, 172, 169, 191),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Assets.icons.setting.path),
                            const SizedBox(width: AppSize.betweenWidgetWidth),
                            Text(
                              "تنظیمات",
                              style: AppTextStyle.heading2(
                                color: AppColors.defaultColorBlack,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(Assets.icons.left1.path)
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Divider(
                        endIndent: 30,
                        indent: 30,
                        color: Color.fromARGB(100, 172, 169, 191),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.icons.logout.path,
                              color: AppColors.warningColor,
                            ),
                            const SizedBox(width: AppSize.betweenWidgetWidth),
                            Text(
                              "خروج از حساب کاربری",
                              style: AppTextStyle.heading2(
                                color: AppColors.warningColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          Assets.icons.left1.path,
                          color: AppColors.warningColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
