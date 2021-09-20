import 'package:get/get.dart';
import 'package:suitcore_flutter_getx_base_code/feature/tweeets/addTweeet/add_tweeet_controller.dart';

class AddTweetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AddTweetController>(AddTweetController());
  }
}
