import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fakeModel.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSize.bodyPaddingLeft,
              AppSize.bodyPaddingTop,
              AppSize.bodyPaddingRight,
              0,
            ),
            child: Column(
              children: [
                appBar(
                  leftSvgIcon: Assets.icons.left1.path,
                  rightText: "لیست مقاله ها",
                  leftIconColor: AppColors.secondaryColor,
                  rightTextColor: AppColors.secondaryColor,
                  leftOnTap: () => Get.back(),
                ),
                SizedBox(height: AppSize.bodyHeight - 10),
                SizedBox(
                  height: Get.height / 1,
                  child: ListView.builder(
                    itemCount: fakeModelBlogList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppSize.borderRadius,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                AppSize.borderRadius,
                              ),
                              child: Image(
                                image:
                                    AssetImage(fakeModelBlogList[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            fakeModelBlogList[index].title,
                            style: AppTextStyle.subTitle(
                              color: AppColors.defaultColorBlack,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          authorAndView(
                            author: fakeModelBlogList[index].author,
                            view: "21456",
                            authorAndViewColor: AppColors.defaultColorBlack
                          ),
                          SizedBox(height: AppSize.bodyHeight),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
