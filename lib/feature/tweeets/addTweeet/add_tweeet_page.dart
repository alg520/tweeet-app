import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitcore_flutter_getx_base_code/data/remote/environment.dart';
import 'package:suitcore_flutter_getx_base_code/feature/tweeets/addTweeet/add_tweeet_controller.dart';

class AddTweeetPage extends StatelessWidget {
  const AddTweeetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTweetController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              iconSize: 20,
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text(
              "Post Tweeet",
              style: TextStyle(fontSize: 16),
            ),
            backgroundColor: Colors.white,
            elevation: 1,
            actions: [
              IconButton(
                onPressed: () {
                  if (controller.tweeet.value.isNotEmpty) {
                    controller.postTweet();
                  }
                },
                icon: Icon(Icons.check),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: controller.user?.imgProfile != ""
                      ? NetworkImage(
                          "${ConfigEnvironments.getEnvironments().toString()}${controller.user?.imgProfile}",
                        )
                      : NetworkImage(
                          "https://smkpsmwarujayeng.sch.id/wp-content/uploads/2020/08/person_110935.png",
                        ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Want to tell something ?",
                        ),
                        maxLines: 5,
                        onChanged: controller.onChangeTweet,
                      ),
                      Obx(
                        () => (controller.file.value != null)
                            ? Container(
                                height: 300,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: FileImage(
                                        controller.file.value as File),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: controller.deleteImage,
                                  icon: Icon(
                                    Icons.close,
                                  ),
                                ),
                              )
                            : Container(),
                      ),
                      Divider(),
                      IconButton(
                        onPressed: () => controller.pickImage(context),
                        iconSize: 20,
                        icon: Icon(Icons.image_outlined),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
