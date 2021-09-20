import 'package:suitcore_flutter_getx_base_code/model/login_result.dart';
import 'package:suitcore_flutter_getx_base_code/model/tweeet.dart';
import 'package:suitcore_flutter_getx_base_code/model/user.dart';

abstract class ModelFactory {
  factory ModelFactory.fromJson(Type type, Map<String, dynamic> json) {
    var strType = type.toString().replaceAll("?", "");
    if (strType == (User).toString()) {
      return User.fromJson(json);
    } else if (strType == (Tweeet).toString()) {
      return Tweeet.fromJson(json);
    } else if (strType == (LoginResult).toString()) {
      return LoginResult.fromJson(json);
    } else {
      throw UnimplementedError('`$type` factory unimplemented.');
    }
  }
}
