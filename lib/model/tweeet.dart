import 'package:hive/hive.dart';
import 'package:suitcore_flutter_getx_base_code/data/local/hive/hive_types.dart';
import 'package:suitcore_flutter_getx_base_code/data/remote/wrapper/model_factory.dart';
import 'package:suitcore_flutter_getx_base_code/model/user.dart';

part 'tweeet.g.dart';

@HiveType(typeId: HiveTypes.Tweeet)
class Tweeet extends HiveObject implements ModelFactory {
  Tweeet({
    required this.id,
    this.user,
    this.tweeet,
    this.image,
    this.createdAt,
    this.likes,
    this.comments,
  });

  @HiveField(0)
  String id;
  @HiveField(1)
  User? user;
  @HiveField(2)
  String? tweeet;
  @HiveField(3)
  String? image;
  @HiveField(4)
  String? createdAt;
  @HiveField(5)
  int? likes;
  @HiveField(6)
  int? comments;

  factory Tweeet.fromJson(Map<String, dynamic> json) => Tweeet(
        id: json["_id"],
        user: User.fromJson(json["user_id"]),
        tweeet: json["tweeet"],
        image: json["image"],
        createdAt: json["createdAt"],
        likes: json["likes"],
        comments: json["comments"],
      );
}
