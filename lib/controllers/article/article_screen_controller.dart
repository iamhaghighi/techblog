import 'package:get/get.dart';
import 'package:techblog/components/apis.dart';
import 'package:techblog/models/articler_model.dart';
import 'package:techblog/services/dio_services.dart';

class ArticleScreenController extends GetxController {
  RxList<ArticleModel> articleItemList = RxList();
  RxBool loading = true.obs;

  @override
  onInit() {
    super.onInit();
    getArticleItems();
  }

  getArticleItems() async {
    var response = await DioService().getMethod(AppApis.articleItem);
    loading.value = true;
    if (response.statusCode == 200) {
      response.data.forEach(
        (element) {
          articleItemList.add(ArticleModel.fromJson(element));
          loading.value = false;
        },
      );
    }
  }
}
