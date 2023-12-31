import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/controllers/article/article_manager_controller.dart';
import 'package:techblog/gen/assets.gen.dart';

import '../../rout_management/route_management.dart';

class ArticleManagerScreen extends StatelessWidget {
  ArticleManagerScreen({super.key});

  final ArticleManagerController articleManagerScreenController =
      Get.put(ArticleManagerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: appBar(
              leftSvgIcon: Assets.icons.left1.path,
              leftIconColor: AppColors.secondaryColor,
              rightText: "مدیریت مقاله",
              rightTextColor: AppColors.secondaryColor,
              leftOnTap: () {
                Get.back();
              },
            ),
          ),
        ),
      ),
      body: Obx(
        () => articleManagerScreenController.loading.value == true
            ? myLoading()
            : articleManagerScreenController.articleList.isEmpty
                ? emptyState()
                : fullState(context),
      ),
    );
  }

  Widget fullState(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSize.bodyPaddingLeft,
            AppSize.bodyPaddingTop - 20,
            AppSize.bodyPaddingRight,
            AppSize.bodyPaddingTop,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.131,
            child: ListView.builder(
              itemCount: articleManagerScreenController.articleList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: Get.height / 6,
                          width: Get.width / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppSize.defaultBorderRadius,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              AppSize.defaultBorderRadius,
                            ),
                            child: CachedNetworkImage(
                              imageUrl: articleManagerScreenController
                                      .articleList[index].image ??
                                  "",
                              imageBuilder: (context, imageProvider) {
                                return SizedBox(
                                  width: double.infinity,
                                  child: Image(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                              placeholder: (context, url) => myLoading(),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.image_not_supported,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSize.defaultBetweenWidth),
                        SizedBox(
                          height: 100,
                          width: Get.width / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                articleManagerScreenController
                                        .articleList[index].title ??
                                    "بدون عنوان",
                                style: AppTextStyle.subTitle(
                                  color: AppColors.defaultColorBlack,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: AppSize.defaultBetweenWidth,
                              ),
                              authorAndView(
                                author: articleManagerScreenController
                                        .articleList[index].author ??
                                    "ناشناس",
                                view: articleManagerScreenController
                                        .articleList[index].view ??
                                    "",
                                authorAndViewColor: AppColors.defaultColorBlack,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSize.defaultBetweenWidth),
                  ],
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(routeArticlePreview);
              },
              child: Text(
                "ایجاد مقاله جدید",
                style: AppTextStyle.heading1(),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget emptyState() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSize.bodyPaddingLeft,
          AppSize.bodyPaddingTop,
          AppSize.bodyPaddingRight,
          AppSize.bodyPaddingTop,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              Column(
                children: [
                  Assets.icons.bot.image(scale: 8),
                  Text("هنوز هیچ مقاله ای منتشر نکردی :(")
                ],
              ),
              const Expanded(child: SizedBox()),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(routeArticlePreview);
                },
                child: Text(
                  "بریم برای نوشتن یه مقاله باحال",
                  style: AppTextStyle.heading1(),
                ),
              ),
            ],
          ),
        ));
  }
}
