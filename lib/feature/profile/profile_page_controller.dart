import 'package:get/get.dart';
import 'package:suitcore_flutter_getx_base_code/feature/auth/auth_controller.dart';
import 'package:suitcore_flutter_getx_base_code/model/user.dart';

class ProfileController extends GetxController {
  final AuthController authController = AuthController.find;

  User? get user => authController.user;

  Future<void> signOut() async {
    await authController.signOut();
  }
}
