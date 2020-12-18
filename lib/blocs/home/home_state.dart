
import 'package:equatable/equatable.dart';
import 'package:flutter_fast_dev/model/home_model.dart';

/// create by 老贺 on 2020-03-03
/// contact me by email 744359304@qq.com
/// 说明: 主页状态类

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final List<HomeModel> datas;
  final int currentTopTabIndex;
  const HomeLoaded(
      {this.currentTopTabIndex,this.datas = const []}) ;

  @override
  List<Object> get props => [currentTopTabIndex,datas];

  @override
  String toString() {
    return 'HomeLoaded{datas: $datas}';
  }
}

class HomeLoadFailed extends HomeState {
  const HomeLoadFailed();

  @override
  List<Object> get props => [];
}
