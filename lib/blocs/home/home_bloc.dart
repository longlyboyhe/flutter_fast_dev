import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fast_dev/app/common/constant.dart';
import 'package:flutter_fast_dev/repositories/itf/home_repository.dart';
import 'home_exp.dart';

/// create by 老贺 on 2020-03-03
/// contact me by email 744359304@qq.com
/// 说明:

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc({@required this.repository});

  @override
  HomeState get initialState => HomeLoading();

  Color get activeHomeColor {
    if (state is HomeLoaded) {
      return Color(Cons.tabColors[(state as HomeLoaded).currentTopTabIndex]);
    }
    return Color(Cons.tabColors[0]);
  }

  Stream<HomeState> mapEventToStateImpl(int index) async* {
    final result = await this.repository.loadDbData(index);
    yield HomeLoaded(currentTopTabIndex: index,datas: result);
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    yield HomeLoading();
    try {
      if (event is EventTabTap) {
        yield* mapEventToStateImpl(event.currentIndex);
      }
    } catch (e) {
      print(e);
      yield HomeLoadFailed();
    }
  }
}
