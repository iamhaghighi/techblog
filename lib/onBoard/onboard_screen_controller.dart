import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/onBoard/onboard_model.dart';

class OnBoardScreenController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxList<OnBoardModel> onBoardModelList = [
    OnBoardModel(
      image: Assets.images.onBoard1.path,
      title: "دنیای تکنولوژی",
      description:
          """هر آنچه در دنیای تکنولوژی و سرگرمی می گذرد را از دست ندهید و مقالات خود را با دیگران به اشتراک بگذارید.""",
    ),
    OnBoardModel(
      image: Assets.images.onBoard2.path,
      title: "همیشه به روز باشید",
      description:
          """آخرین اخبار و رویدادهای دنیا را با این برنامه دنبال کنید.""",
    ),
    OnBoardModel(
      image: Assets.images.onBoard3.path,
      title: "سرگرمی بی پایان",
      description:
          """مجموعه ای بی نظیر از سریال ها، فیلم ها و بازی ها را در این برنامه تجربه کنید.""",
    ),
  ].obs;

  Rx<PageController> controller = PageController(initialPage: 0).obs;
}
