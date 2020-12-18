import 'package:flutter_fast_dev/app/enums.dart';
import 'package:flutter_fast_dev/app/storage/app_storage.dart';
import 'package:flutter_fast_dev/app/storage/dao/widget_dao.dart';
import 'package:flutter_fast_dev/app/storage/po/widget_po.dart';
import 'package:flutter_fast_dev/model/home_model.dart';
import 'package:flutter_fast_dev/repositories/itf/home_repository.dart';

/// create by 老贺 on 2020-03-03
/// contact me by email 744359304@qq.com
/// 说明 : Widget数据仓库

class HomeDbRepository implements HomeRepository {
  final AppStorage storage;

  WidgetDao _widgetDao;

  HomeDbRepository(this.storage) {
    _widgetDao = WidgetDao(storage);
  }

  @override
  Future<List<HomeModel>> loadDbData(int id) async{
    List<HomeModel> list;
    if(id==1){
      List<Map<String, dynamic>> data = await _widgetDao.queryByFamily(ThemeFamily.statelessWidget);
      List<WidgetPo> widgets = data.map((e) => WidgetPo.fromJson(e)).toList();
      list = widgets.map(HomeModel.fromPo).toList();
    }else if(id==2){
      List<Map<String, dynamic>> data = await _widgetDao.queryByFamily(ThemeFamily.statefulWidget);
      List<WidgetPo> widgets = data.map((e) => WidgetPo.fromJson(e)).toList();
      list = widgets.map(HomeModel.fromPo).toList();
    }else if(id==3){
      List<Map<String, dynamic>> data = await _widgetDao.queryByFamily(ThemeFamily.sliver);
      List<WidgetPo> widgets = data.map((e) => WidgetPo.fromJson(e)).toList();
      list = widgets.map(HomeModel.fromPo).toList();
    }else if(id==4){
      List<Map<String, dynamic>> data = await _widgetDao.queryByFamily(ThemeFamily.multiChildRenderObjectWidget);
      List<WidgetPo> widgets = data.map((e) => WidgetPo.fromJson(e)).toList();
      list = widgets.map(HomeModel.fromPo).toList();
    }else if(id==5){
      List<Map<String, dynamic>> data = await _widgetDao.queryByFamily(ThemeFamily.singleChildRenderObjectWidget);
      List<WidgetPo> widgets = data.map((e) => WidgetPo.fromJson(e)).toList();
      list = widgets.map(HomeModel.fromPo).toList();
    }else if(id==6){
      List<Map<String, dynamic>> data = await _widgetDao.queryByFamily(ThemeFamily.other);
      List<WidgetPo> widgets = data.map((e) => WidgetPo.fromJson(e)).toList();
      list = widgets.map(HomeModel.fromPo).toList();
    }
    return list;
  }
}
