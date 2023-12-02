import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/controllers/article/article_content_controller.dart';
import 'package:techblog/controllers/article/article_screen_controller.dart';
import 'package:techblog/controllers/main/home_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final HomeScreenController homeScreenController = Get.put(
    HomeScreenController(),
  );
  final ArticleScreenController articleScreenController = Get.put(
    ArticleScreenController(),
  );
  final ArticleContentController articleContentController = Get.put(
    ArticleContentController(),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeScreenController.loading.value != false
          ? myLoading()
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // APP BAR & COVER
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
                          rightOnTap: () {
                            homeScreenController.key!.currentState!
                                .openDrawer();
                          },
                        ),
                        SizedBox(height: AppSize.defaultBodyHeight),
                        // cover
                        InkWell(
                          onTap: () {
                            var id = homeScreenController.posterInfo.value.id!;
                            articleContentController.getArticleInfo(id);
                            Get.toNamed(routeArticleContent);
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: Get.height / 2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppSize.defaultBorderRadius),
                                ),
                                foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppSize.defaultBorderRadius),
                                  gradient: const LinearGradient(
                                    colors: AppGradient.primaryGradient,
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      AppSize.defaultBorderRadius),
                                  child: CachedNetworkImage(
                                    imageUrl: homeScreenController
                                        .posterInfo.value.image!,
                                    placeholder: (context, url) => myLoading(),
                                    errorWidget: (context, url, error) =>
                                        Assets.icons.imageNotSupported.image(),
                                    imageBuilder: (context, imageProvider) {
                                      return Image(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        homeScreenController
                                            .posterInfo.value.title!,
                                        style: AppTextStyle.title(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 15),
                                      authorAndView(
                                        author: "محمد حقیقی",
                                        view: "25674",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // TAGS
                  SizedBox(height: AppSize.defaultBodyHeight),
                  tags(
                    modeList: homeScreenController.tagsList,
                    listViewSizedBoxHeight: 60,
                    isPadding: true,
                    leftPadding: AppSize.bodyPaddingLeft,
                    rightPadding: AppSize.bodyPaddingRight,
                    betweenWidgetWidth: AppSize.defaultBetweenWidth,
                  ),
                  // blog
                  InkWell(
                    onTap: () {
                      articleScreenController.articleList.clear();
                      articleScreenController.getNewArticle();
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
                  SizedBox(height: AppSize.defaultBodyHeight - 20),
                  viewContentBox(
                    modelList: homeScreenController.articleTopVisitedList,
                    isPadding: true,
                    rightPadding: AppSize.bodyPaddingRight,
                    leftPadding: AppSize.bodyPaddingLeft,
                    betweenWidgetWidth: AppSize.defaultBetweenWidth,
                  ),
                  SizedBox(height: AppSize.defaultBodyHeight),
                  // podcast
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: AppSize.bodyPaddingRight,
                      ),
                      child: iconWithTitle(
                        svgIcon: Assets.icons.microphone.path,
                        title: "مشاهده داغ ترین پادکست ها",
                        svgIconAndTitleColor: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.defaultBodyHeight - 20),
                  viewContentBox(
                    modelList: homeScreenController.articleTopPodcastList,
                    isPadding: true,
                    rightPadding: AppSize.bodyPaddingRight,
                    leftPadding: AppSize.bodyPaddingLeft,
                    betweenWidgetWidth: AppSize.defaultBetweenWidth,
                    isDifferentVariable: true,
                  ),
                  // height for bottomNav
                  SizedBox(height: AppSize.defaultBodyHeight + 50),
                ],
              ),
            ),
    );
  }
}
