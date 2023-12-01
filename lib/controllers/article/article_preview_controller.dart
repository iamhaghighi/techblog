import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/components/app_get_storage.dart';
import 'package:techblog/controllers/other/file_picker_controller.dart';
import 'package:techblog/main.dart';
import 'package:techblog/models/article_content_model.dart';
import 'package:techblog/services/dio_services.dart';
import 'package:dio/dio.dart' as dio;

class ArticlePreviewController extends GetxController {
  RxBool loading = true.obs;
  TextEditingController articlePreviewTitleUpdate = TextEditingController();
  Rx<ArticleContentModel> articleListInfo = ArticleContentModel(
    title: "اینجا عنوان مطلب قرار میگیرد",
    content:
        """من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی""",
    catId: '6',
    image: '',
    catName: 'مثلا: برنامه نویسی',
  ).obs;

  Future postArticle() async {
    var filePickerController = Get.find<FilePickerController>();
    loading.value = true;
    Map<String, dynamic> map = {
      'title': articleListInfo.value.title,
      'content': articleListInfo.value.content,
      'cat_id': articleListInfo.value.catId,
      'tag_list': "[2, 6]",
      'user_id': GetStorage().read(AppStorage.userId),
      'image': await dio.MultipartFile.fromFile(
        filePickerController.file.value.path!,
      ),
      'command': 'store',
    };
    var response = await DioService().postMethod(
      map,
      "https://techblog.sasansafari.com/Techblog/api/article/post.php",
    );
    log(response.toString());
    if (response.data['success'] == true) {
      Get.toNamed(routeMainScreen);
    } else {
      Get.snackbar("خطا", "پست منترش نشد");
    }
  }

  updatePreviewTitle() {
    articleListInfo.update((val) {
      val!.title = articlePreviewTitleUpdate.text;
    });
    Get.back();
  }
}
