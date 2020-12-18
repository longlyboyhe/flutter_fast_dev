import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fast_dev/repositories/itf/recommend_repository.dart';
import 'recommend_exp.dart';

/// create by 老贺 on 2020-03-03
/// contact me by email 744359304@qq.com
/// 说明:

class RecommendBloc extends Bloc<RecommendEvent, RecommendState> {
  final RecommendRepository repository;

  RecommendBloc({@required this.repository});

  @override
  RecommendState get initialState => RecommendLoading();


  @override
  Stream<RecommendState> mapEventToState(RecommendEvent event) async* {
    if (event is EventUpdataData) {
      yield* _mapUpdataDataToState(event.data);
    }
  }

  Stream<RecommendState> _mapUpdataDataToState(dynamic data) async* {
    yield RecommendLoading();
    try {
      final result = await this.repository.loadData();
      yield RecommendLoaded(datas: result);
    } catch (err) {
      print(err);
      yield RecommendLoadFailed();
    }
  }
}
