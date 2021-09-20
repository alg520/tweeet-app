import 'package:get/get.dart';
import 'package:suitcore_flutter_getx_base_code/binding/add_tweeet_binding.dart';
import 'package:suitcore_flutter_getx_base_code/binding/home_binding.dart';
import 'package:suitcore_flutter_getx_base_code/binding/login_binding.dart';
import 'package:suitcore_flutter_getx_base_code/binding/profile_binding.dart';
import 'package:suitcore_flutter_getx_base_code/feature/loader/loading_page.dart';
import 'package:suitcore_flutter_getx_base_code/feature/login/login_page.dart';
import 'package:suitcore_flutter_getx_base_code/feature/profile/profile_page.dart';
import 'package:suitcore_flutter_getx_base_code/feature/tweeets/addTweeet/add_tweeet_page.dart';
import 'package:suitcore_flutter_getx_base_code/feature/tweeets/tweeets_page.dart';

import 'page_names.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.LOADER,
      page: () => LoadingPage(),
    ),
    GetPage(
      name: PageName.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: PageName.HOME,
      page: () => TweeetPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: PageName.PROFILE,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: PageName.ADDTWEEET,
      page: () => AddTweeetPage(),
      binding: AddTweetBinding(),
    )
  ];
}
