import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/controllers/main/home_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';

class RegCat extends StatelessWidget {
  RegCat({super.key});

  final HomeScreenController homeScreenController = Get.put(
    HomeScreenController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            gridViewBuilder(),
            SizedBox(height: AppSize.bodyHeight),
            Assets.icons.line.image(scale: 3),
            SizedBox(height: AppSize.bodyHeight),
            gridViewBuilder(),
            SizedBox(height: AppSize.bodyHeight),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "ادامه",
                style: AppTextStyle.heading1(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox gridViewBuilder() {
    return SizedBox(
      height: Get.height / 8,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          childAspectRatio: 0.31,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.quinaryColor,
                    borderRadius: BorderRadius.circular(
                      AppSize.borderRadius,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          homeScreenController.tagsList[index].title!,
                          style: AppTextStyle.heading2(fontSize: 12),

                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
