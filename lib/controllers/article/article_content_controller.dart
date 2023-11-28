import 'package:get/get.dart';
import 'package:techblog/components/apis.dart';
import '../../models/article_content_model.dart';
import '../../models/articler_model.dart';
import '../../models/tags_model.dart';
import '../../services/dio_services.dart';

class ArticleContentController extends GetxController {
  Rx<ArticleContentModel> articleInfo = ArticleContentModel().obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> relatedList = RxList();
  RxBool loading = true.obs;

  getArticleInfo(String id) async {
    loading.value = true;
    var response = await DioService().getMethod(
      "${AppApis.base}article/get.php?command=info&id=$id&user_id=1",
    );

    if (response.statusCode == 200) {
      articleInfo.value = ArticleContentModel.fromJson(response.data['info']);

      tagsList.clear();
      response.data['tags'].forEach(
        (element) {
          tagsList.add(
            TagsModel.fromJson(element),
          );
        },
      );
      relatedList.clear();
      response.data['related'].forEach(
        (element) {
          relatedList.add(
            ArticleModel.fromJson(element),
          );
        },
      );

      loading.value = false;
    }
  }
}
