import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fast_dev/components/flutter/empty_page.dart';
import 'package:flutter_fast_dev/app/common/constant.dart';
import 'package:flutter_fast_dev/app/utils/px_dp_convert.dart';
import 'package:flutter_fast_dev/blocs/home/home_exp.dart';
import 'package:flutter_fast_dev/blocs/recommend/recommend_exp.dart';
import 'package:flutter_fast_dev/model/recommend_model.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: BlocBuilder<RecommendBloc, RecommendState>(builder: (ctx, state) {
      return CustomScrollView(
        slivers: <Widget>[
          _buildSliverAppBar(ctx, state),
          _buildContent(ctx, state),
        ],
      );
    }));
  }

  Widget _buildSliverAppBar(BuildContext context, RecommendState state) =>
      SliverAppBar(
        pinned: true,
        elevation: 0,
        flexibleSpace: PreferredSize(
          child: AppBar(
            title: Text(Cons.ICONS_MAP.elementAt(1)),
            backgroundColor:Cons.defaultColor,
            brightness: Brightness.dark,
            textTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          preferredSize: Size.fromHeight(dp(55)),
        ),
      );


  Widget _buildContent(BuildContext context, RecommendState state) {
    if (state is HomeLoading) {
      return SliverToBoxAdapter(
        child: Container(),
      );
    }
    if (state is RecommendLoaded) {
      List<RecommendModel> items = state.datas;
      if (items == null || items.isEmpty) {
        return SliverToBoxAdapter(
          child: EmptyPage(),
        );
      }
      return SliverList(
        delegate: SliverChildBuilderDelegate(
            (_, int index) => _buildRecommendItem(items.elementAt(index)),
            childCount: items.length),
      );
    }

    if (state is HomeLoadFailed) {
      return SliverToBoxAdapter(
        child: Container(
          child: Text('加载数据异常'),
        ),
      );
    }
    return SliverToBoxAdapter(
      child: Container(),
    );
  }

  Widget _getWidget(RecommendModel model) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: ListTile(
        title: Text(model.chapterName),
        //leading: Text(model.chapterName),
        subtitle: Text(model.title),
        onTap:() {
          print('点击了：${model.title}');
        }
    ));
  }

  Widget _buildRecommendItem(RecommendModel model) =>
      BlocBuilder<RecommendBloc, RecommendState>(
        builder: (_, state) {
          return _getWidget(model);
        },
      );

  @override
  bool get wantKeepAlive => true;
}
