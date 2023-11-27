import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/main.dart';
import 'package:techblog/controllers/onboard_screen_controller.dart';

class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({super.key});
  final OnBoardScreenController onBoardScreenController = Get.put(
    OnBoardScreenController(),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.defaultColorWhite,
        body: SafeArea(
          child: Column(
            children: [
              buildDots(),
              pageViewBuilder(),
              onBoardScreenController.currentIndex <
                      onBoardScreenController.onBoardModelList.length - 1
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppSize.bodyPaddingLeft,
                        0,
                        AppSize.bodyPaddingRight,
                        0,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              AppColors.primaryColor,
                            ),
                          ),
                          onPressed: () {
                            onBoardScreenController.controller.value.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear,
                            );
                          },
                          child: Text(
                            "بعدی",
                            style: AppTextStyle.heading1(
                              color: AppColors.defaultColorWhite,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppSize.bodyPaddingLeft,
                        0,
                        AppSize.bodyPaddingRight,
                        0,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              AppColors.primaryColor,
                            ),
                          ),
                          onPressed: () {
                            Get.offAndToNamed(routeMainScreen);
                          },
                          child: Text(
                            "بریم شروع کنیم",
                            style: AppTextStyle.heading1(
                              color: AppColors.defaultColorWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDots() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        5,
        AppSize.bodyPaddingTop,
        5,
        0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onBoardScreenController.onBoardModelList.length,
          (index) {
            var lastItem =
                index == onBoardScreenController.onBoardModelList.length - 1;
            return AnimatedContainer(
              curve: Curves.linear,
              height: 6,
              width: Get.width / 3.3,
              margin: EdgeInsets.only(
                left: lastItem ? 0 : 5,
              ),
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: onBoardScreenController.currentIndex.value == index
                    ? AppColors.primaryColor
                    : AppColors.onBoardDots,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget pageViewBuilder() {
    return SizedBox(
      height: Get.height / 1.2,
      child: PageView.builder(
        controller: onBoardScreenController.controller.value,
        onPageChanged: (index) {
          onBoardScreenController.currentIndex.value = index;
        },
        itemCount: onBoardScreenController.onBoardModelList.length,
        itemBuilder: (content, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSize.bodyPaddingLeft,
              0,
              AppSize.bodyPaddingRight,
              0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height / 2.2,
                  child: Image(
                    image: AssetImage(
                      onBoardScreenController.onBoardModelList[index].image,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Text(
                      onBoardScreenController.onBoardModelList[index].title,
                      style: AppTextStyle.title(
                        color: AppColors.defaultColorBlack,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: AppSize.bodyHeight - 20),
                    Text(
                      onBoardScreenController
                          .onBoardModelList[index].description,
                      style: AppTextStyle.heading1(
                        color: AppColors.defaultColorBlack,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
