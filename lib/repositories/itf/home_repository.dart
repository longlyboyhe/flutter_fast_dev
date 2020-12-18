import 'package:flutter_fast_dev/model/home_model.dart';

/// create by 老贺 on 2020-03-03
/// contact me by email 744359304@qq.com

abstract class HomeRepository {
  Future<List<HomeModel>> loadDbData(int id);
}