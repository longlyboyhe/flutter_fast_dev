import 'package:flutter_fast_dev/app/common/constant.dart';
import 'package:flutter_fast_dev/app/network/api.dart';
import 'package:flutter_fast_dev/app/network/app_network.dart';
import 'package:flutter_fast_dev/model/base_model.dart';
import 'package:flutter_fast_dev/model/recommend_data.dart';
import 'package:flutter_fast_dev/model/recommend_model.dart';
import 'package:flutter_fast_dev/repositories/itf/recommend_repository.dart';

/// create by 老贺 on 2020-03-03
/// contact me by email 744359304@qq.com
/// 说明 : Widget数据仓库
///
///
class RecommendNetRepository implements RecommendRepository{

  RecommendNetRepository();

  @override
  Future<List<RecommendModel>> loadData() async{
    BaseResponse<Map<String,dynamic>> baseResponse = await HttpManager().get<Map<String,dynamic>>(API.recommend);
    if (baseResponse.code != Cons.status_success) {
      return Future.error(baseResponse.msg);
    }
    List<RecommendModel> tList;
    if (baseResponse.data != null) {
      RecommendDataModel recommendDataModel = RecommendDataModel.fromJson(baseResponse.data);
      tList = recommendDataModel.datas.map((value){
        return RecommendModel.fromJson(value);
      }).toList();
    }
    return tList;
  }
}
