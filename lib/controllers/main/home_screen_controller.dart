import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/apis.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/articler_model.dart';
import 'package:techblog/models/fakeModel.dart';
import 'package:techblog/models/podcast_model.dart';
import 'package:techblog/models/poster_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_services.dart';

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

  GlobalKey<ScaffoldState>? key;
  Rx<PosterModel> posterInfo = PosterModel().obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> articleTopVisitedList = RxList();
  RxList<PodcastsModel> articleTopPodcastList = RxList();
  RxBool loading = true.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItem();
  }

  getHomeItem() async {
    var response = await DioService().getMethod(AppApis.poster);
    loading.value = true;
    if (response.statusCode == 200) {
      // poster
      posterInfo.value = PosterModel.fromJson(response.data['poster']);
      // tags
      response.data['tags'].forEach((element) {
        tagsList.add(TagsModel.fromJson(element));
      });
      // article
      response.data['top_visited'].forEach((element) {
        articleTopVisitedList.add(ArticleModel.fromJson(element));
      });
      response.data['top_podcasts'].forEach((element) {
        articleTopPodcastList.add(PodcastsModel.fromJson(element));
      });
      loading.value = false;
    }
  }
}
