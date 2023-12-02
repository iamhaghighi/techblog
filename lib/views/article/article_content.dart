import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/gen/assets.gen.dart';

import '../../controllers/article/article_content_controller.dart';

class ArticleContent extends StatelessWidget {
  ArticleContent({super.key});

  final ArticleContentController articleContentController = Get.put(
    ArticleContentController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Obx(
          () => articleContentController.loading.value != false
              ? myLoading()
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: Get.height / 3,
                            width: double.infinity,
                            foregroundDecoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: AppGradient.primaryGradient,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: <double>[0.01, 1],
                              ),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: articleContentController
                                  .articleInfo.value.image!,
                              fit: BoxFit.cover,
                              placeholder: (context, err) => myLoading(),
                              errorWidget: (context, err, icon) =>
                                  Assets.icons.imageNotSupported.image(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              AppSize.bodyPaddingLeft - 5,
                              AppSize.bodyPaddingTop - 10,
                              AppSize.bodyPaddingRight - 5,
                              0,
                            ),
                            child: appBar(
                              leftSvgIcon: Assets.icons.left1.path,
                              leftIconColor: AppColors.defaultColorWhite,
                              rightIcon: Icons.share,
                              rightIconColor: AppColors.defaultColorWhite,
                              rightLeftSvgIcon: Assets.icons.bookmark.path,
                              rightLeftSvgIconColor:
                                  AppColors.defaultColorWhite,
                              rightIconSize: 23,
                              leftOnTap: () => Get.back(),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: AppSize.defaultBodyHeight - 15),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          AppSize.bodyPaddingLeft - 5,
                          0,
                          AppSize.bodyPaddingRight - 5,
                          0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              articleContentController.articleInfo.value.title!,
                              style: AppTextStyle.title(
                                  color: AppColors.defaultColorBlack),
                            ),
                            SizedBox(height: AppSize.defaultBodyHeight - 20),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.profile.path,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: AppSize.defaultBetweenWidth,
                                ),
                                Text(
                                  "${articleContentController.articleInfo.value.author!} - ${articleContentController.articleInfo.value.createdAt!}",
                                  style: AppTextStyle.heading2(
                                    color: AppColors.defaultColorBlack,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: AppSize.defaultBodyHeight - 20),
                            HtmlWidget(
                              """<p style="text-align: justify;">${articleContentController.articleInfo.value.content!}</p>""",
                              textStyle: AppTextStyle.heading2(
                                  color: AppColors.defaultColorBlack),
                              enableCaching: true,
                              onLoadingBuilder:
                                  (context, element, loadingProgress) =>
                                      myLoading(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSize.defaultBodyHeight),
                      tags(
                        modeList: articleContentController.tagsList,
                        listViewSizedBoxHeight: 60,
                        isPadding: true,
                        rightPadding: AppSize.bodyPaddingRight - 5,
                        leftPadding: AppSize.bodyPaddingLeft - 5,
                        betweenWidgetWidth: AppSize.defaultBetweenWidth,
                      ),
                      SizedBox(height: AppSize.defaultBodyHeight),
                      viewContentBox(
                        modelList: articleContentController.relatedList,
                        isPadding: true,
                        rightPadding: AppSize.bodyPaddingRight - 5,
                        leftPadding: AppSize.bodyPaddingLeft - 5,
                        betweenWidgetWidth: AppSize.defaultBetweenWidth,
                      ),
                      SizedBox(height: AppSize.defaultBodyHeight),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}





// Row(
//                 children: [
//                   Row(
//                     children: [
//                       Assets.icons.share.image(
//                         color: AppColors.defaultColorWhite,
//                         scale: 3,
//                       ),
//                       SvgPicture.asset(
//                         Assets.icons.bookmark.path,
//                         color: AppColors.defaultColorWhite,
//                       )
//                     ],
//                   ),
//                   SvgPicture.asset(
//                     Assets.icons.left1.path,
//                     color: AppColors.defaultColorWhite,
//                   ),
//                 ],
//               ),