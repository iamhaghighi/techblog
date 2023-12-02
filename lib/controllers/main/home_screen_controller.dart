import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/apis.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/podcast_model.dart';
import 'package:techblog/models/poster_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_services.dart';

class HomeScreenController extends GetxController {

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