import 'package:hive/hive.dart';
import 'package:suitcore_flutter_getx_base_code/model/tweeet.dart';
import 'package:suitcore_flutter_getx_base_code/model/user.dart';

class HiveAdapters {
  void registerAdapter() {
    Hive.registerAdapter<User>(UserAdapter());
    Hive.registerAdapter<Tweeet>(TweeetAdapter());
  }
}
