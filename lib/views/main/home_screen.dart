import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';
import 'package:techblog/models/fakeModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
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
                  leftSvgIcon: Assets.icons.search.path,
                  rightSvgIcon: Assets.icons.menuHamburger.path,
                  centerPngIcon: Assets.icons.logoPng.path,
                  centerPngIconScale: 4,
                  leftSvgIconHeight: 20,
                ),
                SizedBox(height: AppSize.bodyHeight),
                // cover
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: Get.height / 2,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppSize.borderRadius),
                      ),
                      foregroundDecoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppSize.borderRadius),
                        gradient: const LinearGradient(
                          colors: AppGradient.primaryGradient,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppSize.borderRadius),
                        child: Image(
                          image: AssetImage(Assets.images.homeScreenCover.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "یک منبع موثق، زمان معرفی GTA 6 رو لوداد. اولین تریلر هم در راه است.",
                              style: AppTextStyle.title(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 15),
                            authorAndView(
                              author: "محمد حقیقی",
                              view: "25678",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSize.bodyHeight),
              ],
            ),
          ),
          // TAGS
          SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: fakeModelTagsList.length,
              itemBuilder: (context, index) {
                bool isLastItem = index == fakeModelTagsList.length - 1;
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    isLastItem ? AppSize.bodyPaddingLeft : 0,
                    0,
                    index == 0
                        ? AppSize.bodyPaddingRight
                        : AppSize.betweenWidgetWidth,
                    0,
                  ),
                  child: tags(
                    svgIcon: Assets.icons.hashtag.path,
                    title: fakeModelTagsList[index].title,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: AppSize.bodyHeight),
          // blog
          InkWell(
            onTap: () {
              Get.toNamed(routeArticleScreen);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                right: AppSize.bodyPaddingRight,
              ),
              child: iconWithTitle(
                title: "مشاهده داغ ترین نوشته ها",
                svgIcon: Assets.icons.pen.path,
                svgIconAndTitleColor: AppColors.secondaryColor,
              ),
            ),
          ),
          SizedBox(height: AppSize.bodyHeight - 20),
          viewContentBox(
            modelList: fakeModelBlogList,
            isPadding: true,
            rightPadding: AppSize.bodyPaddingRight,
            leftPadding: AppSize.bodyPaddingLeft,
            betweenWidgetWidth: AppSize.betweenWidgetWidth,
          ),
          SizedBox(height: AppSize.bodyHeight),
          // podcast
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: AppSize.bodyPaddingRight),
              child: iconWithTitle(
                svgIcon: Assets.icons.microphone.path,
                title: "مشاهده داغ ترین پادکست ها",
                svgIconAndTitleColor: AppColors.secondaryColor,
              ),
            ),
          ),
          SizedBox(height: AppSize.bodyHeight - 20),
          viewContentBox(
            modelList: fakeModelPodcastList,
            isPadding: true,
            rightPadding: AppSize.bodyPaddingRight,
            leftPadding: AppSize.bodyPaddingLeft,
            betweenWidgetWidth: AppSize.betweenWidgetWidth,
          ),
          // height for bottomNav
          SizedBox(height: AppSize.bodyHeight + 50),
        ],
      ),
    );
  }
}
