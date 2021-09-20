import 'package:get/get.dart';
import 'package:suitcore_flutter_getx_base_code/feature/profile/profile_page_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
  }
}
