import 'package:get/get.dart';
import 'package:techblog/models/podcast_file_model.dart';

import 'package:techblog/services/dio_services.dart';

class PodcastContentController extends GetxController {
  var id;
  PodcastContentController({this.id});
  RxList<PodcastFileModel> podcastFileList = RxList();
  RxBool loading = true.obs;

  @override
  onInit() {
    super.onInit();
    getPodcastsFile();
  }

  getPodcastsFile() async {
    loading.value = true;
    var response = await DioService().getMethod(
      "https://techblog.sasansafari.com/Techblog/api/podcast/get.php?command=get_files&podcats_id=$id",
    );
    if (response.statusCode == 200) {
      for (var element in response.data['files']) {
        podcastFileList.add(
          PodcastFileModel.fromjson(element),
        );
      }
      loading.value = false;
    }
  }
}
