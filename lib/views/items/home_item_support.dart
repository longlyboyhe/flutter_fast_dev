import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fast_dev/app/enums.dart';
import 'package:flutter_fast_dev/model/home_model.dart';
import 'package:flutter_fast_dev/views/items/techno_widget_list_item.dart';

/// create by 老贺 on 2020/4/28
/// contact me by email 744359304@qq.com
/// 说明:

class HomeItemSupport {
  static Widget get(
    HomeModel model,
    int index,
  ) {
    switch (index) {
      case 0:
        return TechnoWidgetListItem(data: model);
      case 1:
        return TechnoWidgetListItem(data: model, isClip: false);
    }
    return TechnoWidgetListItem(data: model);
  }

  static List<Widget> itemSimples() => [
        TechnoWidgetListItem(data: getContainer()),
        TechnoWidgetListItem(
          data: getContainer(),
          isClip: false,
        )
      ];

  static HomeModel getContainer() => HomeModel(
      id: Random().nextInt(10000),
      name: 'Container',
      nameCN: "",
      lever: 5,
      family: ThemeFamily.statefulWidget,
      info: '用于容纳单个子组件的容器组件。集成了若干个单子组件的功能，如内外边距、形变、装饰、约束等...');
}
