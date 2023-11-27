// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/controllers/main/main_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:techblog/models/fakeModel.dart';

Widget getWidgetRight({
  required String? rightSvgIcon,
  required Color rightSvgIconColor,
  required double? rightSvgIconHeight,
  required IconData? rightIcon,
  required double? rightIconSize,
  required Color? rightIconColor,
  required String rightText,
  required Color rightTextColor,
  required String rightLeftSvgIcon,
  required Color rightLeftSvgIconColor,
}) {
  if (rightSvgIcon != null) {
    return SvgPicture.asset(
      rightSvgIcon,
      // ignore: deprecated_member_use
      color: rightSvgIconColor,
      height: rightSvgIconHeight,
    );
  } else if (rightSvgIcon == null) {
    if (rightIcon != null) {
      return Row(
        children: [
          Icon(
            rightIcon,
            color: rightIconColor,
            size: rightIconSize,
          ),
          const SizedBox(width: AppSize.betweenWidgetWidth),
          SvgPicture.asset(
            rightLeftSvgIcon,
            color: rightLeftSvgIconColor,
          )
        ],
      );
    } else {
      return Text(
        rightText,
        style: AppTextStyle.heading1(
          color: rightTextColor,
        ),
      );
    }
  } else {
    return const Text("");
  }
}

Widget getWidgetLeft({
  required String leftText,
  required Color leftTextColor,
  required double? leftSvgIconTextWidth,
  required String? leftSvgIcon,
  required double? leftSvgIconHeight,
  required IconData? leftIcon,
  required Color? leftIconColor,
}) {
  if (leftSvgIcon != null) {
    return Row(
      children: [
        Text(
          leftText,
          style: AppTextStyle.heading1(
            color: leftTextColor,
          ),
        ),
        SizedBox(width: leftSvgIconTextWidth),
        SvgPicture.asset(
          leftSvgIcon,
          height: leftSvgIconHeight,
          // ignore: deprecated_member_use
          color: leftIconColor,
        ),
      ],
    );
  } else {
    return Icon(leftIcon, color: leftIconColor);
  }
}

Widget appBar({
  // we should use icon or svg, one of them.
  IconData? rightIcon,
  Color rightIconColor = AppColors.quinaryColor,
  String? rightSvgIcon,
  double? rightSvgIconHeight,
  String rightText = '',
  Color rightTextColor = AppColors.quinaryColor,
  String rightLeftSvgIcon = '',
  Color rightLeftSvgIconColor = AppColors.quinaryColor,
  double? rightIconSize,
  IconData? leftIcon,
  Color leftIconColor = AppColors.quinaryColor,
  String? leftSvgIcon,
  double? leftSvgIconHeight,
  String leftText = '',
  Color leftTextColor = AppColors.quinaryColor,
  double? leftSvgIconTextWidth = 6,
  String? centerPngIcon,
  double? centerPngIconScale,
  void Function()? rightOnTap,
  void Function()? leftOnTap,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Right Icon. here, if svg is null, The icon is displayed and vice versa
      InkWell(
        onTap: rightOnTap,
        child: getWidgetRight(
          rightIcon: rightIcon,
          rightSvgIcon: rightSvgIcon,
          rightSvgIconHeight: rightSvgIconHeight,
          rightText: rightText,
          rightSvgIconColor: rightIconColor,
          rightIconColor: rightIconColor,
          rightTextColor: rightTextColor,
          rightLeftSvgIcon: rightLeftSvgIcon,
          rightLeftSvgIconColor: rightLeftSvgIconColor,
          rightIconSize: rightIconSize,
        ),
      ),
      // here, if want use center icon
      centerPngIcon == null
          ? const Text('')
          : Image.asset(centerPngIcon, scale: centerPngIconScale),
      // Left Icon. here, if svg is null, The icon is displayed and vice versa
      InkWell(
          onTap: leftOnTap,
          child: getWidgetLeft(
            leftIcon: leftIcon,
            leftIconColor: leftIconColor,
            leftSvgIcon: leftSvgIcon,
            leftSvgIconHeight: leftSvgIconHeight,
            leftText: leftText,
            leftSvgIconTextWidth: leftSvgIconTextWidth,
            leftTextColor: leftTextColor,
          )),
    ],
  );
}

Widget iconWithTitle({
  required String svgIcon,
  required String title,
  Color svgIconAndTitleColor = AppColors.quinaryColor,
}) {
  return Row(
    children: [
      SvgPicture.asset(
        svgIcon,
        color: svgIconAndTitleColor,
      ),
      const SizedBox(width: AppSize.betweenWidgetWidth),
      Text(
        title,
        style: AppTextStyle.heading1(color: svgIconAndTitleColor),
      )
    ],
  );
}

Widget tags(
    {required List modeList,
    required double listViewSizedBoxHeight,
    Axis scrollDirection = Axis.horizontal,
    bool isPadding = false,
    double leftPadding = 0,
    double rightPadding = 0,
    double betweenWidgetWidth = 0,
    Color hashtagContainerColor = AppColors.quinaryColor,
    Color iconColor = AppColors.defaultColorWhite}) {
  return SizedBox(
    height: listViewSizedBoxHeight,
    child: ListView.builder(
      scrollDirection: scrollDirection,
      physics: const BouncingScrollPhysics(),
      itemCount: modeList.length,
      itemBuilder: (context, index) {
        bool isLastItem = index == modeList.length - 1;
        return Padding(
          padding: EdgeInsets.fromLTRB(
            isPadding
                ? isLastItem
                    ? leftPadding
                    : 0
                : 0,
            0,
            isPadding
                ? index == 0
                    ? rightPadding
                    : betweenWidgetWidth
                : 0,
            0,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: hashtagContainerColor,
                  borderRadius: BorderRadius.circular(
                    AppSize.borderRadius,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.hashtag.path,
                        width: 13,
                        color: iconColor,
                      ),
                      const SizedBox(
                        width: AppSize.betweenWidgetWidth,
                      ),
                      Text(
                        modeList[index].title,
                        style: AppTextStyle.heading2(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget viewContentBox({
  required List modelList,
  double listViewHeightSize = 200,
  ScrollPhysics scrollPhysics = const BouncingScrollPhysics(),
  Axis scrollDirection = Axis.horizontal,
  bool isPadding = false,
  double leftPadding = 0,
  double rightPadding = 0,
  double betweenWidgetWidth = 0,
}) {
  return SizedBox(
    height: listViewHeightSize,
    child: ListView.builder(
      itemCount: modelList.length,
      physics: scrollPhysics,
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) {
        bool isLastItem = index == modelList.length - 1;
        return Padding(
          padding: EdgeInsets.fromLTRB(
            isPadding
                ? isLastItem
                    ? leftPadding
                    : 0
                : 0,
            0,
            isPadding
                ? index == 0
                    ? rightPadding
                    : betweenWidgetWidth
                : 0,
            0,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width / 2.2,
                        height: Get.height / 4.5,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSize.borderRadius),
                        ),
                        foregroundDecoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSize.borderRadius),
                          gradient: const LinearGradient(
                            colors: AppGradient.contentGradient,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppSize.borderRadius),
                          child: Image(
                            image: AssetImage(
                              modelList[index].image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: Get.width / 2.2,
                    height: Get.height / 4.5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        8,
                        0,
                        8,
                        8,
                      ),
                      child: authorAndView(
                        author: fakeModelBlogList[index].author,
                        view: "2547",
                        fontSize: 12
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: Get.width / 2.2,
                child: Text(
                  modelList[index].title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      AppTextStyle.subTitle(color: AppColors.defaultColorBlack),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    super.key,
    required this.changeScreenIndex,
  });

  Rx<int Function(int)> changeScreenIndex;

  MainScreenController changeIndex = Get.put(
    MainScreenController(),
  );

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.quaternaryColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.navBottomShadow,
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        height: 65,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 3, 15, 0),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    changeIndex.iconStates.value = [true, false, false];
                    changeScreenIndex.value(0);
                    ;
                  },
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          changeIndex.iconStates[0]
                              ? Assets.icons.homeBold.path
                              : Assets.icons.home.path,
                          color: AppColors.defaultColorWhite,
                        ),
                        Text(
                          "خانه",
                          style: AppTextStyle.heading2(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    changeIndex.iconStates.value = [false, true, false];
                  },
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          changeIndex.iconStates[1]
                              ? Assets.icons.editBold.path
                              : Assets.icons.edit.path,
                          color: AppColors.defaultColorWhite,
                        ),
                        Text(
                          "مقاله نویسی",
                          style: AppTextStyle.heading2(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    changeIndex.iconStates.value = [false, false, true];
                    changeScreenIndex.value(1);
                  },
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          changeIndex.iconStates[2]
                              ? Assets.icons.profileBold.path
                              : Assets.icons.profile.path,
                          color: AppColors.defaultColorWhite,
                        ),
                        Text(
                          "پروفایل",
                          style: AppTextStyle.heading2(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget authorAndView({
  required String author,
  required String view,
  Color authorAndViewColor = AppColors.defaultColorWhite,
  double fontSize = 14,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        author,
        style: AppTextStyle.heading2(
            color: authorAndViewColor, fontSize: fontSize),
      ),
      Row(
        children: [
          SizedBox(
            height: 16,
            child: Text(
              view,
              style: AppTextStyle.heading2(
                  fontSize: 12, color: authorAndViewColor),
            ),
          ),
          const SizedBox(width: 3),
          Icon(
            CupertinoIcons.eye_fill,
            color: authorAndViewColor,
            size: 12,
          )
        ],
      ),
    ],
  );
}
