import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:suitcore_flutter_getx_base_code/data/remote/api_services.dart';
import 'package:suitcore_flutter_getx_base_code/feature/auth/auth_controller.dart';
import 'package:suitcore_flutter_getx_base_code/model/user.dart';
import 'package:suitcore_flutter_getx_base_code/utills/widget/dynamic_image_picker.dart';
import 'package:suitcore_flutter_getx_base_code/data/remote/errorhandler/error_handler.dart';

class AddTweetController extends GetxController {
  final AuthController authController = AuthController.find;
  User? get user => authController.user;

  Rx<String> tweeet = "".obs;
  Rx<File?> file = Rx(null);

  void deleteImage() {
    file.value = null;
  }

  void onChangeTweet(String text) {
    tweeet.value = text;
  }

  void pickImage(BuildContext context) {
    dynamicPickImage(
      context: context,
      image: (image) {
        file.value = image;
      },
    );
    update();
  }

  Future<void> postTweet() async {
    try {
      var token = await authController.getToken();
      var client = await RestClient.create(
        headers: {"authorization": "Bearer ${token ?? ""}"},
      );
      if (file.value != null) {
        var result = await client
            .postTweeetWithImage(tweeet.value, file.value!)
            .validateStatus();
        if (result.status == 200) {
          Get.back();
        }
      } else {
        var result = await client.postTweeet(tweeet.value).validateStatus();
        if (result.status == 200) {
          Get.back();
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
