import 'package:flutter/material.dart';

/// create by 老贺 on 2020/6/16
/// contact me by email 744359304@qq.com
/// 说明: 

class NoScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) => child;
}