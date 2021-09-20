import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:suitcore_flutter_getx_base_code/feature/tweeets/widgets/tweeets_item.dart';

import '../tweeets_controller.dart';

class ListTweeetbuilder extends StatelessWidget {
  const ListTweeetbuilder(
    this.controller, {
    Key? key,
  }) : super(key: key);
  final TweeetsController controller;
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: controller.hasNext,
      controller: controller.refreshController,
      onRefresh: controller.refreshPage,
      onLoading: controller.loadNextPage,
      child: ListView.separated(
        itemCount: controller.dataList.length,
        itemBuilder: (context, index) {
          return TweeetListItem(
            index: index,
            mData: controller.dataList[index],
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
