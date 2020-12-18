import 'package:flutter/material.dart';
import 'package:flutter_fast_dev/app/common/constant.dart';
import 'package:flutter_fast_dev/app/utils/px_dp_convert.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// create by 老贺 on 2020-04-11
/// contact me by email 744359304@qq.com
/// 说明: 自定义底部导航栏

class XBottomBar extends StatefulWidget {
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final List<String> itemData;
  final Function(int) onItemClick;

  XBottomBar(
      {
        this.selectedItemColor = Cons.defaultColor,
        this.unselectedItemColor = Colors.black12,
        @required this.itemData,
        @required this.onItemClick
      });

  @override
  _XBottomBarState createState() => _XBottomBarState();
}

class _XBottomBarState extends State<XBottomBar> {
  int _currentIndex = 0;  // 底部导航当前页面

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: Cons.dessignWidth)..init(context);
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: widget.selectedItemColor,
        unselectedItemColor: widget.unselectedItemColor,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        onTap: (index) =>
            _tapTab(index),
        items: [
          _BottomNavigationBarItem(0,'assets/images/nav/nav-22.jpg','assets/images/nav/nav-21.jpg'),
          _BottomNavigationBarItem(1,'assets/images/nav/nav-52.jpg','assets/images/nav/nav-51.jpg'),
          _BottomNavigationBarItem(2,'assets/images/nav/nav-42.jpg','assets/images/nav/nav-41.jpg'),
          _BottomNavigationBarItem(3,'assets/images/nav/nav-32.jpg','assets/images/nav/nav-31.jpg')
        ]
    );
  }

  List<String> get info => widget.itemData;

  Widget _bottomIcon(path) {
    return Padding(
        padding: EdgeInsets.only(bottom: dp(4)),
        child: Image.asset(
          path,
          width: dp(25),
          height: dp(25),
          repeat:ImageRepeat.noRepeat,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        )
    );
  }

  dynamic _BottomNavigationBarItem(int index,String selectedIconPath,String unSelectedIconPath) {
    final bool active = index == _currentIndex;
    return BottomNavigationBarItem(
        label: info.elementAt(index),
        icon: active
            ? _bottomIcon(selectedIconPath)
            : _bottomIcon(unSelectedIconPath));
  }

  _tapTab(int i) {
    setState(() {
      _currentIndex = i;
      if (widget.onItemClick != null) {
        widget.onItemClick(_currentIndex);
      }
    });
  }
}
