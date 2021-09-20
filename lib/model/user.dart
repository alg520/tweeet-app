import 'package:hive/hive.dart';
import 'package:suitcore_flutter_getx_base_code/data/local/hive/hive_types.dart';
import 'package:suitcore_flutter_getx_base_code/data/remote/wrapper/model_factory.dart';

part 'user.g.dart';

@HiveType(typeId: HiveTypes.USER)
class User extends HiveObject implements ModelFactory {
  User({
    this.id,
    this.name,
    this.email,
    this.imgProfile,
  });

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? imgProfile;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        imgProfile: json["img_profile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "img_profile": imgProfile,
      };

  // @override
  // List<Object?> get props => [id, name, email, gender, status, picture];
}
