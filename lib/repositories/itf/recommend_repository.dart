import 'package:flutter_fast_dev/model/recommend_model.dart';

/// create by 老贺 on 2020-03-03
/// contact me by email 744359304@qq.com
/// 说明：定义获取推荐接口类、方法.
///   和Java一样，dart也有接口，但是和Java还是有区别的。
///   首先，dart的接口没有interface关键字定义接口，而是普通类或抽象类都可以作为接口被实现。
///   同样使用implements关键字进行实现。
///   但是dart的接口有点奇怪，如果实现的类是普通类，会将普通类和抽象中的属性的方法全部需要覆写一遍。
///   而因为抽象类可以定义抽象方法，普通类不可以，所以一般如果要实现像Java接口那样的方式，一般会使用抽象类。
///   建议使用抽象类定义接口。
///
///

abstract class RecommendRepository {
  Future<List<RecommendModel>> loadData();
}