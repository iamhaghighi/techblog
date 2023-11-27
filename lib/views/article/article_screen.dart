import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/controllers/article/article_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';

class ArticleScreen extends StatelessWidget {
  ArticleScreen({super.key});
  final articleScreenController = Get.find<ArticleScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Obx(
        () => articleScreenController.loading.value != false
            ? myLoading()
            : SafeArea(
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
                            itemCount:
                                articleScreenController.articleItemList.length,
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
                                      child: CachedNetworkImage(
                                        imageUrl: articleScreenController
                                            .articleItemList[index].image!,
                                        imageBuilder: (context, imageProvider) {
                                          return Container(
                                            color: Colors.red,
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
                                          .articleItemList[index].title!,
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
                                        .articleItemList[index].author!,
                                    view: "21456",
                                    authorAndViewColor:
                                        AppColors.defaultColorBlack,
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
      ),
    );
  }
}
