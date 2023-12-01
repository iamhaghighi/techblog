import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/controllers/article/article_preview_controller.dart';
import 'package:techblog/controllers/main/home_screen_controller.dart';
import 'package:techblog/controllers/other/file_picker_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/services/file_picker.dart';

class ArticlePreview extends StatelessWidget {
  ArticlePreview({super.key});

  final FilePickerController filePickerController = Get.put(
    FilePickerController(),
  );

  final ArticlePreviewController articlePreviewController = Get.put(
    ArticlePreviewController(),
  );

  final HomeScreenController homeScreenController = Get.put(
    HomeScreenController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Obx(
        () => Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Get.height / 3,
                  foregroundDecoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppGradient.primaryGradient,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  width: double.infinity,
                  child: filePickerController.file.value.name != 'nothing'
                      ? Image.file(
                          File(
                            filePickerController.file.value.path!,
                          ),
                          fit: BoxFit.cover,
                        )
                      : Assets.images.logo.image(scale: 2),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () async {
                      await filePicker();
                    },
                    child: Center(
                      child: Container(
                        width: 130,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.borderRadius),
                            topRight: Radius.circular(AppSize.borderRadius),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "انتخاب تصویر",
                              style: AppTextStyle.heading2(),
                            ),
                            const Icon(
                              CupertinoIcons.plus,
                              color: AppColors.defaultColorWhite,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: AppSize.bodyPaddingLeft,
                  top: AppSize.bodyPaddingTop - 10,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Assets.icons.left1.svg(
                      color: AppColors.defaultColorWhite,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSize.bodyPaddingLeft,
                AppSize.bodyPaddingTop,
                AppSize.bodyPaddingRight,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      articlePreviewTitleDialog();
                    },
                    child: articlePreviewTitle(
                      title: "ویرایش عنوان مقاله",
                    ),
                  ),
                  const SizedBox(height: AppSize.betweenWidgetWidth),
                  Text(
                    articlePreviewController.articleListInfo.value.title!,
                    style: AppTextStyle.heading2(
                      color: AppColors.defaultColorBlack,
                    ),
                  ),
                  const SizedBox(height: AppSize.betweenWidgetWidth),
                  articlePreviewTitle(title: "ویرایش متن اصلی مقاله"),
                  const SizedBox(height: AppSize.betweenWidgetWidth),
                  SingleChildScrollView(
                    child: Text(
                      articlePreviewController.articleListInfo.value.content!,
                      style: AppTextStyle.heading2(
                          color: AppColors.defaultColorBlack),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: AppSize.betweenWidgetWidth),
                  InkWell(
                    onTap: () {
                      articlePreviewTagsBottomSheet();
                    },
                    child: articlePreviewTitle(title: "انتخاب دسته بندی"),
                  ),
                  const SizedBox(height: AppSize.betweenWidgetWidth),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.quinaryColor,
                        borderRadius: BorderRadius.circular(
                          AppSize.borderRadius,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.hashtag.svg(
                              width: 13,
                              color: AppColors.defaultColorWhite,
                            ),
                            const SizedBox(width: AppSize.betweenWidgetWidth),
                            Text(
                              articlePreviewController
                                      .articleListInfo.value.catName!,
                              style: AppTextStyle.heading2(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () async {
                await articlePreviewController.postArticle();
              },
              child: Text(
                articlePreviewController.loading.value ? "ثبت مقاله" : "ثبت شد",
                style: AppTextStyle.heading1(),
              ),
            ),
            SizedBox(height: AppSize.bodyHeight),
          ],
        ),
      ),
    );
  }

  Future<dynamic> articlePreviewTagsBottomSheet() {
    return Get.bottomSheet(
      Container(
        height: Get.height / 2.5,
        color: AppColors.bg,
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 3,
          children:
              List.generate(homeScreenController.tagsList.length, (index) {
            return InkWell(
              onTap: () {
                articlePreviewController.articleListInfo.update((val) {
                  val!.catName = homeScreenController.tagsList[index].title!;
                  val.catId = homeScreenController.tagsList[index].id!;
                  Get.back();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  width: 50,
                  height: 50,
                  color: AppColors.quinaryColor,
                  child: Center(
                    child: Text(
                      homeScreenController.tagsList[index].title!,
                      style: AppTextStyle.heading2(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Future<dynamic> articlePreviewTitleDialog() {
    return Get.defaultDialog(
      title: "عنوان مطلب",
      titleStyle: AppTextStyle.heading1(),
      backgroundColor: AppColors.secondaryColor,
      content: Container(
        width: double.infinity,
        color: Colors.white,
        child: TextField(
          onSubmitted: (value) {
            articlePreviewController.updatePreviewTitle();
          },
          controller: articlePreviewController.articlePreviewTitleUpdate,
          style: const TextStyle(color: AppColors.defaultColorBlack),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "مثال: بازی دومینو",
            hintStyle: AppTextStyle.heading2(
              color: AppColors.hintColor,
            ),
          ),
        ),
      ),
      confirm: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            AppColors.defaultColorWhite,
          ),
        ),
        onPressed: () {
          articlePreviewController.updatePreviewTitle();
        },
        child: Text(
          "ثبت عنوان",
          style: AppTextStyle.heading1(
            color: AppColors.defaultColorBlack,
          ),
        ),
      ),
    );
  }

  Widget articlePreviewTitle({required title}) {
    return Row(
      children: [
        Assets.icons.pen.svg(
          height: 20,
          color: AppColors.secondaryColor,
        ),
        const SizedBox(width: AppSize.betweenWidgetWidth),
        Text(
          title,
          style: AppTextStyle.heading1(
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}
