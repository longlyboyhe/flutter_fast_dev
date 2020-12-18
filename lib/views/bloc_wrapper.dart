import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fast_dev/app/storage/app_storage.dart';
import 'package:flutter_fast_dev/blocs/global/global_bloc.dart';
import 'package:flutter_fast_dev/blocs/global/global_event.dart';
import 'package:flutter_fast_dev/blocs/home/home_bloc.dart';
import 'package:flutter_fast_dev/blocs/home/home_event.dart';
import 'package:flutter_fast_dev/blocs/recommend/recommend_exp.dart';
import 'package:flutter_fast_dev/repositories/impl/home_db_repository_impl.dart';
import 'package:flutter_fast_dev/repositories/impl/recommend_repository_impl.dart';

/// create by 老贺 on 2020/4/28
/// contact me by email 744359304@qq.com
/// 说明: Bloc提供器包裹层

final storage = AppStorage();

class BlocWrapper extends StatefulWidget {
  final Widget child;

  BlocWrapper({this.child});

  @override
  _BlocWrapperState createState() => _BlocWrapperState();
}

class _BlocWrapperState extends State<BlocWrapper> {
  final homeRepository = HomeDbRepository(storage);
  final recommendRepository = RecommendNetRepository();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(//使用MultiBlocProvider包裹
        providers: [
      ///Bloc提供器全局
      BlocProvider<GlobalBloc>(
          create: (_) => GlobalBloc(storage)
            ..add(EventInitApp())),
      ///首页
      BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(repository: homeRepository)
            ..add(EventTabTap(0))),
      ///推荐或发现
      BlocProvider<RecommendBloc>(
         create: (_) => RecommendBloc(repository: recommendRepository)
           ..add(EventUpdataData(null))),
       ],
        child: widget.child);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
