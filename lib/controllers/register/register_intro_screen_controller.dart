import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/components/apis.dart';
import 'package:techblog/components/app_get_storage.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/main.dart';
import 'package:techblog/services/dio_services.dart';

class RegisterIntroScreenController extends GetxController {
  TextEditingController registerEmailTextEditingController =
      TextEditingController();
  TextEditingController verifyCodeTextEditingController =
      TextEditingController();

  var email = '';
  var userId = '';

  Future registerEmail() async {
    Map<String, dynamic> map = {
      "email": registerEmailTextEditingController.text,
      "command": "register",
    };

    var response =
        await DioService().postMethod(map, AppApis.registerAndVerifyCode);

    email = registerEmailTextEditingController.text;
    userId = response.data['user_id'];
  }

  Future verifyCode() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': verifyCodeTextEditingController.text,
      'command': 'verify',
    };
    var response =
        await DioService().postMethod(map, AppApis.registerAndVerifyCode);
    var status = response.data['response'];
    switch (status) {
      case 'verified':
        final box = GetStorage();
        box.write(AppStorage.userId, response.data['user_id']);
        box.write(AppStorage.token, response.data['token']);
        Get.offAllNamed(routeMainScreen);
        break;
      case 'incorrect_code':
        Get.snackbar("خطا", "کد شما اشباه است");
        break;
      case 'expired':
        Get.snackbar("خظا", "کد شما منقضی شده است، دوباره امتحان کنید");
        break;
    }
  }

  checkLogin() {
    if (GetStorage().read('token') != null) {
      articleManagerBottomSheet();
    } else {
      Get.toNamed(routeRegisterIntroScreen);
    }
  }
}
