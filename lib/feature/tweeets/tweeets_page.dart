import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitcore_flutter_getx_base_code/data/remote/environment.dart';
import 'package:suitcore_flutter_getx_base_code/feature/tweeets/widgets/tweeets_list_builder.dart';
import 'package:suitcore_flutter_getx_base_code/routes/page_names.dart';
import 'package:suitcore_flutter_getx_base_code/utills/widget/state_handle_widget.dart';
import 'tweeets_controller.dart';

class TweeetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'txt_menu_home'.tr,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          GetBuilder<TweeetsController>(
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(PageName.PROFILE);
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                      "${ConfigEnvironments.getEnvironments().toString()}${controller.auth.user?.imgProfile}",
                    ),
                  ),
                ),
              );
            },
          ),
        ],
        elevation: 1,
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          child: GetBuilder<TweeetsController>(
            builder: (controller) {
              return StateHandleWidget(
                loadingEnabled: controller.isShimmering,
                emptyEnabled: controller.isEmptyData,
                emptySubtitle: 'txt_empty_user'.tr,
                errorEnabled: controller.isError,
                errorText: 'txt_error_general'.tr,
                onRetryPressed: () {
                  controller.refreshPage();
                },
                body: ListTweeetbuilder(controller),
              );
            },
          ),
        ),
      ),
      floatingActionButton: GetBuilder<TweeetsController>(
        builder: (controller) {
          if (controller.token != null) {
            return FloatingActionButton(
              onPressed: () {
                Get.toNamed(PageName.ADDTWEEET);
              },
              child: Icon(Icons.add),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
