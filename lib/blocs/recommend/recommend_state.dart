import 'package:equatable/equatable.dart';
import 'package:flutter_fast_dev/model/banner_model.dart';
import 'package:flutter_fast_dev/model/recommend_model.dart';

/// create by 老贺 on 2020-03-03
/// contact me by email 744359304@qq.com
/// 说明: 主页状态类

abstract class RecommendState extends Equatable {
  const RecommendState();
  @override
  List<Object> get props => [];
}

class RecommendLoading extends RecommendState {
  const RecommendLoading();

  @override
  List<Object> get props => [];
}

class RecommendLoaded extends RecommendState {
  final List<RecommendModel> datas;
  const RecommendLoaded(
      {this.datas = const []}) ;

  @override
  List<Object> get props => [datas];

  @override
  String toString() {
    return 'HomeLoaded{datas: $datas}';
  }
}

class RecommendLoadFailed extends RecommendState {
  const RecommendLoadFailed();

  @override
  List<Object> get props => [];
}
