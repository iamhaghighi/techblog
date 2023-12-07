import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/controllers/article/article_content_controller.dart';
import 'package:techblog/controllers/article/article_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';

class ArticleScreen extends StatelessWidget {
  ArticleScreen({super.key});
  final articleScreenController = Get.find<ArticleScreenController>();
  final ArticleContentController articleContentController = Get.put(
    ArticleContentController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Obx(
        () => articleScreenController.loading.value != false
            ? myLoading()
            : SafeArea(
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
                        rightText:
                            articleScreenController.appBarTitleDynamic.value,
                        leftIconColor: AppColors.secondaryColor,
                        rightTextColor: AppColors.secondaryColor,
                        leftOnTap: () {
                          articleScreenController.appBarTitleDynamic.value =
                              "لیست مقاله ها";
                          Get.back();
                        },
                      ),
                      SizedBox(height: AppSize.defaultBodyHeight - 10),
                      SizedBox(
                        height: Get.height / 1.158,
                        child: ListView.builder(
                          itemCount: articleScreenController.articleList.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                var id = articleScreenController
                                    .articleList[index].id!;
                                articleContentController.getArticleInfo(id);
                                Get.toNamed(routeArticleContent);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
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
                                        imageUrl: articleScreenController
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
                                        placeholder: (context, url) =>
                                            myLoading(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.image_not_supported,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      articleScreenController
                                              .articleList[index].title ??
                                          "بدون عنوان",
                                      style: AppTextStyle.subTitle(
                                        color: AppColors.defaultColorBlack,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  authorAndView(
                                    author: articleScreenController
                                            .articleList[index].author ??
                                        "ناشناس",
                                    view: articleScreenController.articleList[index].view ?? "0",
                                    authorAndViewColor:
                                        AppColors.defaultColorBlack,
                                  ),
                                  SizedBox(height: AppSize.defaultBodyHeight),
                                ],
                              ),
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
