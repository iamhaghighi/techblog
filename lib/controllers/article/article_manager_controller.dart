import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/components/app_get_storage.dart';
import 'package:techblog/models/articler_model.dart';
import 'package:techblog/services/dio_services.dart';

class ArticleManagerController extends GetxController {
  RxBool loading = true.obs;
  RxList<ArticleModel> articleList = RxList();

  @override
  onInit() {
    super.onInit();
    getPublishedByMe();
  }

  getPublishedByMe() async {
    loading.value = true;
    var userId = GetStorage().read(AppStorage.userId);
    var response = await DioService().getMethod(
      "https://techblog.sasansafari.com/Techblog/api/article/get.php?command=published_by_me&user_id=$userId",
    );
    articleList.clear();
    if (response.statusCode == 200) {
      response.data.forEach(
        (element) {
          articleList.add(
            ArticleModel.fromJson(element),
          );
        },
      );
      loading.value = false;
    }
  }
}
