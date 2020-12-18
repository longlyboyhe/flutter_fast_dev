import '../enums.dart';

/// create by 老贺 on 2020-03-07
/// contact me by email 744359304@qq.com
/// 说明:

class Convert {

  static ThemeFamily toFamily(int id) {
    switch (id) {
      case 0:
        return ThemeFamily.statelessWidget;
      case 1:
        return ThemeFamily.statefulWidget;
      case 2:
        return ThemeFamily.sliver;
      case 3:
        return ThemeFamily.proxyWidget;
      case 4:
        return ThemeFamily.singleChildRenderObjectWidget;
      case 5:
        return ThemeFamily.multiChildRenderObjectWidget;
      case 6:
        return ThemeFamily.other;
      default:
        return ThemeFamily.other;
    }
  }
}
