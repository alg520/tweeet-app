import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:suitcore_flutter_getx_base_code/data/local/hive/hive_constants.dart';
import 'package:suitcore_flutter_getx_base_code/data/remote/api_services.dart';
import 'package:suitcore_flutter_getx_base_code/data/remote/base/base_list_controller.dart';
import 'package:suitcore_flutter_getx_base_code/data/remote/errorhandler/error_handler.dart';
import 'package:suitcore_flutter_getx_base_code/feature/auth/auth_controller.dart';
import 'package:suitcore_flutter_getx_base_code/model/tweeet.dart';

class TweeetsController extends BaseListController<Tweeet> {
  AuthController auth = Get.find();
  Rx<String?> _token = "".obs;
  String? get token => _token.value;

  @override
  void onInit() async {
    getCacheBox(HiveConstants.TWEEETS);
    getTweeets();
    _token.value = await auth.getToken();
    super.onInit();
  }

  @override
  void refreshPage() {
    page = 1;
    getTweeets();
  }

  @override
  void loadNextPage() {
    getTweeets(page: page++);
  }

  Future<void> getTweeets({int page = 1}) async {
    loadingState();
    await RestClient.create().then(
      (value) => value
          .getTweeets(page.toString(), perPage.toString())
          .validateStatus()
          .then((data) {
        hasNext = data.data!.isNotEmpty;
        if (page == 1) {
          dataList.clear();
          saveCache(data.data, idList: data.data?.map((e) => e.id.toString()));
        }
        setFinishCallbacks(data.data!);
      }).handleError((onError) {
        finishLoadData(errorMessage: onError.toString());
        debugPrint("error : " + onError.toString());
      }),
    );
  }
}
