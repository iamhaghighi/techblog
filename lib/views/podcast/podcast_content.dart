import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/controllers/podcast/podcast_content_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/podcast_model.dart';

// ignore: must_be_immutable
class PodcastContent extends StatelessWidget {
  late PodcastContentController controller;
  late PodcastsModel podcastsModel;

  PodcastContent({super.key}) {
    podcastsModel = Get.arguments;
    controller = Get.put(
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
        () => controller.loading.value
            ? myLoading()
            : SafeArea(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
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
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(
                            //     AppSize.bodyPaddingLeft - 5,
                            //     AppSize.bodyPaddingTop - 10,
                            //     AppSize.bodyPaddingRight - 5,
                            //     0,
                            //   ),
                            //   child: appBar(
                            //     leftSvgIcon: Assets.icons.left1.path,
                            //     leftIconColor: AppColors.defaultColorWhite,
                            //     rightIcon: Icons.share,
                            //     rightIconColor: AppColors.defaultColorWhite,
                            //     rightIconSize: 23,
                            //     leftOnTap: () => Get.back(),
                            //   ),
                            // ),
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
                                  color: AppColors.defaultColorBlack,
                                ),
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
                                  itemCount: controller.podcastFileList.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                      () => Padding(
                                        padding: const EdgeInsets.only(
                                          bottom:
                                              AppSize.defaultBetweenWidth + 10,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            controller.player.seek(
                                              Duration.zero,
                                              index: index,
                                            );
                                            controller.currentFileIndex.value =
                                                controller.player.currentIndex!;
                                            ;
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Assets.icons.microphone.svg(
                                                    height: 20,
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                  const SizedBox(
                                                    width: AppSize
                                                        .defaultBetweenWidth,
                                                  ),
                                                  SizedBox(
                                                    width: Get.size.width / 1.8,
                                                    child: Obx(
                                                      () => Text(
                                                        controller
                                                            .podcastFileList[
                                                                index]
                                                            .title!,
                                                        style: AppTextStyle
                                                            .subTitle(
                                                          color: controller
                                                                      .currentFileIndex
                                                                      .value ==
                                                                  index
                                                              ? AppColors
                                                                  .secondaryColor
                                                              : AppColors
                                                                  .defaultColorBlack,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "${controller.podcastFileList[index].length!}:00",
                                                style: AppTextStyle.subTitle(
                                                  color: AppColors
                                                      .defaultColorBlack,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                              Obx(
                                () => ProgressBar(
                                  progress: controller.progressVal.value,
                                  total: controller.player.duration ??
                                      const Duration(seconds: 0),
                                  buffered: controller.bufferVal.value,
                                  baseBarColor: AppColors.defaultColorWhite,
                                  thumbColor: AppColors.secondaryColor,
                                  progressBarColor: AppColors.secondaryColor,
                                  timeLabelTextStyle: AppTextStyle.heading2(),
                                  onSeek: (position) {
                                    controller.player.playing
                                        ? controller.startProgress()
                                        : controller.timer!.cancel();
                                    controller.player.seek(position);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: Get.mediaQuery.size.width / 1.08,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.player.seekToNext();
                                        controller.currentFileIndex.value =
                                            controller.player.currentIndex!;
                                      },
                                      child: Assets.icons.next.svg(
                                        color: AppColors.defaultColorWhite,
                                        width: 30,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        controller.player.playing
                                            ? controller.timer!.cancel()
                                            : controller.startProgress();

                                        controller.player.playing
                                            ? controller.player.pause()
                                            : await controller.player.play();

                                        controller.playState.value =
                                            controller.player.playing;

                                        controller.currentFileIndex.value =
                                            controller.player.currentIndex!;
                                      },
                                      child: Obx(
                                        () => Icon(
                                          controller.playState.value
                                              ? Icons.pause_circle_filled
                                              : Icons.play_circle_filled,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.player.seekToPrevious();
                                        controller.currentFileIndex.value =
                                            controller.player.currentIndex!;
                                      },
                                      child: Assets.icons.previous.svg(
                                        color: AppColors.defaultColorWhite,
                                        width: 30,
                                      ),
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
