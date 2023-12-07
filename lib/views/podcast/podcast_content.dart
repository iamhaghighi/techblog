import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/controllers/podcast/podcast_content_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/podcast_model.dart';

// ignore: must_be_immutable
class PodcastContent extends StatelessWidget {
  late PodcastContentController podcastContentController;
  late PodcastsModel podcastsModel;

  PodcastContent({super.key}) {
    podcastsModel = Get.arguments;
    podcastContentController = Get.put(
      PodcastContentController(
        id: podcastsModel.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Obx(
        () => podcastContentController.loading.value != false
            ? myLoading()
            : SafeArea(
                child: Stack(
                  children: [
                    Column(
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
                                imageUrl: podcastsModel.poster!,
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
                                rightIconSize: 23,
                                leftOnTap: () => Get.back(),
                              ),
                            ),
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
                                podcastsModel.title!,
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
                                    podcastsModel.author ?? "ناشناس",
                                    style: AppTextStyle.heading2(
                                      color: AppColors.defaultColorBlack,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: AppSize.defaultBodyHeight - 15),
                              SizedBox(
                                height: 320,
                                child: ListView.builder(
                                  itemCount: podcastContentController
                                      .podcastFileList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom:
                                            AppSize.defaultBetweenWidth + 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Assets.icons.microphone.svg(
                                                height: 20,
                                                color: AppColors.primaryColor,
                                              ),
                                              const SizedBox(
                                                  width: AppSize
                                                      .defaultBetweenWidth),
                                              Text(
                                                podcastContentController
                                                    .podcastFileList[index]
                                                    .title!,
                                                style: AppTextStyle.subTitle(
                                                  color: AppColors
                                                      .defaultColorBlack,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            podcastContentController
                                                .podcastFileList[index].length!,
                                            style: AppTextStyle.subTitle(
                                              color:
                                                  AppColors.defaultColorBlack,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: AppSize.bodyPaddingLeft,
                      right: AppSize.bodyPaddingRight,
                      bottom: AppSize.bodyPaddingTop,
                      child: Container(
                        height: Get.height / 8,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(
                              AppSize.defaultBorderRadius),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              LinearPercentIndicator(
                                barRadius: const Radius.circular(
                                    AppSize.defaultBorderRadius),
                                lineHeight: 8,
                                percent: 0.3,
                                backgroundColor: AppColors.defaultColorWhite,
                                progressColor: AppColors.secondaryColor,
                              ),
                              SizedBox(
                                width: Get.mediaQuery.size.width / 1.08,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Assets.icons.next.svg(
                                      color: AppColors.defaultColorWhite,
                                      width: 30,
                                    ),
                                    Assets.icons.play.svg(
                                      color: AppColors.defaultColorWhite,
                                      width: 30,
                                    ),
                                    Assets.icons.previous.svg(
                                      color: AppColors.defaultColorWhite,
                                      width: 30,
                                    ),
                                    const SizedBox(),
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Assets.icons.repeate.svg(
                                        color: AppColors.defaultColorWhite,
                                        width: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
}
