import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fast_dev/components/flutter/empty_page.dart';
import 'package:flutter_fast_dev/app/common/constant.dart';
import 'package:flutter_fast_dev/app/utils/px_dp_convert.dart';
import 'package:flutter_fast_dev/blocs/bloc_exp.dart';
import 'package:flutter_fast_dev/blocs/home/home_exp.dart';
import 'package:flutter_fast_dev/components/permanent/feedback_widget.dart';
import 'package:flutter_fast_dev/model/home_model.dart';
import 'package:flutter_fast_dev/views/items/home_item_support.dart';
import 'package:flutter_fast_dev/views/pages/home/sticky_tabbar_delegate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(EventTabTap(0));
    this.tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(builder: (ctx, state) {
          final Color color =  BlocProvider.of<HomeBloc>(context).activeHomeColor;
      return CustomScrollView(
        slivers: <Widget>[
          _buildSliverAppBar(ctx, state,color),
          _buildPersistentHeader(),
          _buildContent(ctx, state),
        ],
      );
    }));
  }

  Widget _buildSliverAppBar(BuildContext context, HomeState state,Color color) =>
      SliverAppBar(
        pinned: true,
        elevation: 0,
        //expandedHeight: 100,
        flexibleSpace: PreferredSize(
          child: AppBar(
            title: Text(Cons.ICONS_MAP.elementAt(0)),
            backgroundColor: color??Colors.red,
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

  Widget _buildPersistentHeader() => SliverPersistentHeader(
      pinned: true,
      delegate: StickyTabBarDelegate(
        child: TabBar(
          labelColor: Colors.black,
          controller: this.tabController,
          labelPadding: EdgeInsets.all(0),
          tabs: <Widget>[
            Tab(text: '基础'),
            Tab(text: '布局'),
            Tab(text: '容器'),
            Tab(text: '功能'),
            Tab(text: '滚动'),
            Tab(text: '装饰'),
            Tab(text: '其他')
          ],
          onTap: (index) => _switchTopTab(index),
        ),
      ));

  Widget _buildContent(BuildContext context, HomeState state) {
    if (state is HomeLoading) {
      return SliverToBoxAdapter(
        child: Container(),
      );
    }
    if (state is HomeLoaded) {
      List<HomeModel> items = state.datas;
      if (items == null || items.isEmpty) {
        return SliverToBoxAdapter(
          child: EmptyPage(),
        );
      }
      return SliverList(
        delegate: SliverChildBuilderDelegate(
            (_, int index) => _buildHomeItem(items[index]),
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

  Widget _buildHomeItem(HomeModel model) =>
      BlocBuilder<GlobalBloc, GlobalState>(
        condition: (p, c) => (p.itemStyleIndex != c.itemStyleIndex),
        builder: (_, state) {
          return FeedbackWidget(
              duration: const Duration(milliseconds: 200),
              // onPressed: () => _toDetailPage(model),
              child: HomeItemSupport.get(model, state.itemStyleIndex));
        },
      );

  _switchTopTab(int index) {
    BlocProvider.of<HomeBloc>(context).add(EventTabTap(index));
  }

  @override
  bool get wantKeepAlive => true;
}

class FlexHeaderDelegate extends SliverPersistentHeaderDelegate {
  FlexHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.childBuilder,
  });

  final double minHeight; //最小高度
  final double maxHeight; //最大高度
  final Widget Function(double offset, double max, double min)
      childBuilder; //最大高度

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return childBuilder(shrinkOffset, maxHeight, minHeight);
  }

  @override //是否需要重建
  bool shouldRebuild(FlexHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
  }
}
