import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:suitcore_flutter_getx_base_code/data/remote/environment.dart';
import 'package:suitcore_flutter_getx_base_code/model/tweeet.dart';

class TweeetListItem extends StatelessWidget {
  final int index;
  final Tweeet mData;
  const TweeetListItem({required this.index, required this.mData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.orangeAccent,
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: mData.user?.imgProfile != ""
                  ? NetworkImage(
                      "${ConfigEnvironments.getEnvironments().toString()}${mData.user?.imgProfile}",
                    )
                  : NetworkImage(
                      "https://smkpsmwarujayeng.sch.id/wp-content/uploads/2020/08/person_110935.png",
                    ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mData.user?.name ?? "",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    child: Text(mData.tweeet ?? ""),
                  ),
                  if (mData.image != "")
                    Container(
                      height: 300,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            "${ConfigEnvironments.getEnvironments().toString()}${mData.image}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 13,
                      ),
                      SizedBox(width: 5),
                      Text(
                        mData.likes.toString(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 25),
                      Icon(
                        Icons.chat_bubble_outline,
                        size: 13,
                      ),
                      SizedBox(width: 5),
                      Text(
                        mData.comments.toString(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
