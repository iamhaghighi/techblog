import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fakeModel.dart';

class HomeScreenController extends GetxController {
  final fakeModelBlogList = [
    FakeModelBlogPod(
      image: Assets.images.blog1.path,
      author: "ژینو امینی",
      view: "1356",
      title:
          "انیمه حمله به تایتان: ۸ نکته که شاید در قسمت آخر از دست داده‌اید!",
    ),
    FakeModelBlogPod(
      image: Assets.images.blog2.path,
      author: "جواد محسنی",
      view: "1278",
      title: "نقد و بررسی بازی Call of Duty: Modern Warfare III",
    ),
    FakeModelBlogPod(
      image: Assets.images.blog3.path,
      author: "پارسا خلیلی",
      view: "9756",
      title:
          "آیا پانیشر در دنیای سینمایی مارول با درجه سنی بزرگسال تایید میشود یا نه؟",
    ),
    FakeModelBlogPod(
      image: Assets.images.blog3.path,
      author: "پارسا خلیلی",
      view: "9756",
      title:
          "آیا پانیشر در دنیای سینمایی مارول با درجه سنی بزرگسال تایید میشود یا نه؟",
    ),
    FakeModelBlogPod(
      image: Assets.images.blog3.path,
      author: "پارسا خلیلی",
      view: "9756",
      title:
          "آیا پانیشر در دنیای سینمایی مارول با درجه سنی بزرگسال تایید میشود یا نه؟",
    ),
    FakeModelBlogPod(
      image: Assets.images.blog3.path,
      author: "پارسا خلیلی",
      view: "9756",
      title:
          "آیا پانیشر در دنیای سینمایی مارول با درجه سنی بزرگسال تایید میشود یا نه؟",
    ),
    FakeModelBlogPod(
      image: Assets.images.blog3.path,
      author: "پارسا خلیلی",
      view: "9756",
      title:
          "آیا پانیشر در دنیای سینمایی مارول با درجه سنی بزرگسال تایید میشود یا نه؟",
    ),
    FakeModelBlogPod(
      image: Assets.images.blog3.path,
      author: "پارسا خلیلی",
      view: "9756",
      title:
          "آیا پانیشر در دنیای سینمایی مارول با درجه سنی بزرگسال تایید میشود یا نه؟",
    ),
  ];
  final fakeModelPodcastList = [
    FakeModelBlogPod(
      image: Assets.images.pod1.path,
      author: "محسن دانشی",
      view: "1356",
      title: "اثری حماسی دراماتیک در وصف داستان غم انگیز",
    ),
    FakeModelBlogPod(
      image: Assets.images.pod2.path,
      author: "علی رضایی",
      view: "1278",
      title: "دو ساعت در دنیای بی رحم بازی تاج و تخت غرق شویدف",
    ),
    FakeModelBlogPod(
      image: Assets.images.pod3.path,
      author: "محمد بختیاری",
      view: "9756",
      title: "Whispers of Forest",
    ),
  ];
  final fakeModelTagsList = [
    FakeModelTags(title: "برنامه نویسی", id: 1),
    FakeModelTags(title: "جاوا", id: 2),
    FakeModelTags(title: "پایتون", id: 3),
    FakeModelTags(title: "پادکست جادی", id: 4),
    FakeModelTags(title: "جاوا اسکریپت", id: 5),
  ];
  Map homeScreenCoverMap = {
    "author": "محمد حقیقی",
    "date": "یک روز پیش",
    "view": "25155",
    "title":
        "یک منبع موثق، زمان معرفی GTA 6 رو لوداد. اولین تریلر هم در راه است."
  };
  // For AppBar
 GlobalKey<ScaffoldState>? key;
}
