import 'package:get/get.dart';
import 'package:techblog/components/apis.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/services/dio_services.dart';

class ArticleScreenController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = true.obs;
  RxString appBarTitleDynamic = "لیست مقاله ها".obs;

  @override
  onInit() {
    super.onInit();
    getNewArticle();
  }

  getNewArticle() async {
    loading.value = true;
    var response = await DioService().getMethod(AppApis.newArticle);
    articleList.clear();
    if (response.statusCode == 200) {
      response.data.forEach(
        (element) {
          articleList.add(ArticleModel.fromJson(element));
        },
      );
      loading.value = false;
    }
  }

  getNewArticleWithTagId(String id) async {
    loading.value = true;
    articleList.clear();

    final queryParam = {
      'command': "get_articles_with_tag_id",
      'tag_id': id,
      'user_id': '',
    };
    var uri = Uri.https(AppApis.base, 'article/get.php?', queryParam);

    var response = await DioService().getMethod(uri.toString());
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(
          ArticleModel.fromJson(element),
        );
      });
      loading.value = false;
    }
  }
}
