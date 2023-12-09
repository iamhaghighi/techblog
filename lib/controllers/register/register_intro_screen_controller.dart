import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/components/apis.dart';
import 'package:techblog/components/app_get_storage.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/size.dart';
import 'package:techblog/components/text_style.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/services/dio_services.dart';
import 'package:techblog/controllers/article/article_manager_controller.dart';

import '../../rout_management/route_management.dart';

class RegisterIntroController extends GetxController {
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

Future<dynamic> articleManagerBottomSheet() {
  ArticleManagerController articleManagerController = Get.put(
    ArticleManagerController(),
  );
  return Get.bottomSheet(
    Container(
      height: Get.height / 3,
      width: Get.size.width / 1,
      decoration: const BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.defaultBorderRadius + 5),
          topRight: Radius.circular(AppSize.defaultBorderRadius + 5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Column(
          children: [
            Row(
              children: [
                Assets.icons.bot.image(
                  scale: 20,
                ),
                const SizedBox(width: AppSize.defaultBetweenWidth),
                Text(
                  "دونسته هات رو به اشتراک بزار",
                  style: AppTextStyle.heading1(
                    color: AppColors.defaultColorBlack,
                  ),
                ),
              ],
            ),
            Text(
              "فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستیدونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار..",
              style: AppTextStyle.heading2(
                color: AppColors.defaultColorBlack,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: AppSize.defaultBodyHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(routeArticleManager);
                    articleManagerController.getPublishedByMe();
                  },
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icons.documentManage.path,
                        ),
                        const SizedBox(
                          height: 30,
                          child: Text("مدیریت مقاله"),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icons.voiceManage.path,
                          width: 30,
                        ),
                        const SizedBox(
                          height: 30,
                          child: Text(
                            "مدیریت پادکست",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
