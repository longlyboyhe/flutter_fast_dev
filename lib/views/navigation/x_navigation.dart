import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fast_dev/app/common/constant.dart';
import 'package:flutter_fast_dev/blocs/home/home_exp.dart';
import 'package:flutter_fast_dev/components/permanent/overlay_tool_wrapper.dart';
import 'package:flutter_fast_dev/views/navigation/x_bottom_bar.dart';
import 'package:flutter_fast_dev/views/pages/home/home_drawer.dart';
import 'package:flutter_fast_dev/views/pages/home/home_page.dart';
import 'package:flutter_fast_dev/views/pages/recommend/recommend_page.dart';

/// create by 老贺
/// 说明: 主题结构 左右滑页 + 底部导航栏

class XNavigation extends StatefulWidget {
  @override
  _XNavigationState createState() => _XNavigationState();
}

class _XNavigationState extends State<XNavigation> {
  PageController _pageController; //页面控制器，初始0

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose(); //释放控制器
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        return Scaffold(
          //左滑页
          // drawer: HomeDrawer(),
            //右滑页
          // endDrawer: HomeRightDrawer(),
          body: _currentPage(),
          bottomNavigationBar: XBottomBar(
              itemData: Cons.ICONS_MAP,
              onItemClick: _onTapNav));
      },
    );
  }

  // 底部导航对应的页面
  Widget _currentPage() {
    var _pages = [
      HomePage(),
      RecommendPage(),
      HomePage(),
      HomePage()
    ];
    return PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: _pages.length,
        itemBuilder: (context,index)=>_pages[index]
    );
  }

  _onTapNav(int index) {
    _pageController.jumpToPage(index);
    if (index == 1) {
      ///TODO 设置点击事件
      //BlocProvider.of<CollectBloc>(context).add(EventSetCollectData());
    }
  }
}
