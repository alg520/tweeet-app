import 'package:get/get.dart';
import 'package:suitcore_flutter_getx_base_code/feature/tweeets/tweeets_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TweeetsController>(() => TweeetsController());
  }
}
