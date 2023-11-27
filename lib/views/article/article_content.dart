import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/controllers/main/home_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';

final homeScreenController = Get.find<HomeScreenController>();

class ArticleContent extends StatelessWidget {
  const ArticleContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SingleChildScrollView(
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
                  child: Assets.images.blog1.image(fit: BoxFit.cover),
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
                    rightLeftSvgIconColor: AppColors.defaultColorWhite,
                    rightIconSize: 23,
                    leftOnTap: () => Get.back(),
                  ),
                )
              ],
            ),
            SizedBox(height: AppSize.bodyHeight - 15),
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
                    homeScreenController.fakeModelBlogList[0].title,
                    style:
                        AppTextStyle.title(color: AppColors.defaultColorBlack),
                  ),
                  SizedBox(height: AppSize.bodyHeight - 20),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.profile.path,
                        height: 15,
                      ),
                      const SizedBox(
                        width: AppSize.betweenWidgetWidth,
                      ),
                      Text(
                        homeScreenController.fakeModelBlogList[0].author,
                        style: AppTextStyle.heading2(
                          color: AppColors.defaultColorBlack,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: AppSize.bodyHeight - 20),
                  HtmlWidget(
                    """<p style="text-align: justify;"> لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد. </p>""",
                    textStyle: AppTextStyle.heading2(
                        color: AppColors.defaultColorBlack),
                    enableCaching: true,
                    onLoadingBuilder: (context, element, loadingProgress) =>
                        myLoading(),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.bodyHeight),
            tags(
              //TODO: change to tagsList from id. after
              modeList: homeScreenController.tagsList,
              listViewSizedBoxHeight: 60,
              isPadding: true,
              rightPadding: AppSize.bodyPaddingRight - 5,
              leftPadding: AppSize.bodyPaddingLeft - 5,
              betweenWidgetWidth: AppSize.betweenWidgetWidth,
            ),
            SizedBox(height: AppSize.bodyHeight),
            viewContentBox(
              //TODO: change to relatedList. after
              modelList: homeScreenController.articleTopVisitedList,
              isPadding: true,
              rightPadding: AppSize.bodyPaddingRight - 5,
              leftPadding: AppSize.bodyPaddingLeft - 5,
              betweenWidgetWidth: AppSize.betweenWidgetWidth,
            ),
            SizedBox(height: AppSize.bodyHeight),
          ],
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