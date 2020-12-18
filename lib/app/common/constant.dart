import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_fast_dev/components/permanent/code/highlighter_style.dart';

class Cons {
  static final baseSchema = 'http';
  static final baseHost = '30.10.56.158';
  static final basePort = '1236';
  static final baseUrl = '${Cons.baseSchema}://${Cons.baseHost}:${Cons.basePort}';
  static String version = 'V1.1.1';
  static const int status_success = 0;
  // 默认主题色
  static const defaultColor = Color(0xffff5d23);
  // 初始化设计稿尺寸
  static final double dessignWidth = 375.0;
  static final double dessignHeight = 1335.0;

  static final double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;

  static const MENU_INFO = <String>["关于", "帮助", "问题反馈"]; //菜单栏
  static const ICONS_MAP = [ "首页",
    "发现",
    "分类",
    "我的"];
    //底栏

  static const tabColors = [
    0xff44D1FD,
    0xffFD4F43,
    0xffB375FF,
    0xFF4CAF50,
    0xFFFF9800,
    0xFF00F1F1,
    0xFFDBD83F
  ];

  static const tabs = <String>[
    'Stles',
    'Stful',
    'Scrow',
    'Mcrow',
    'Sliver',
    'Proxy',
    'Other'
  ]; //标题列表

  static const fontFamilySupport = <String>[
    'local',
    'ComicNeue',
    'IndieFlower',
    'BalooBhai2',
    'Inconsolata',
    'Neucha'
  ];

  static Map<HighlighterStyle, String> codeThemeSupport = <HighlighterStyle, String>{
    HighlighterStyle.fromColors(HighlighterStyle.gitHub):"GitHub - Power By 老贺",
    HighlighterStyle.fromColors(HighlighterStyle.darkColor):"捷特黑 - Power By 老贺",
    HighlighterStyle.fromColors(HighlighterStyle.lightColor):"捷特白 - Power By 老贺",
    HighlighterStyle.fromColors(HighlighterStyle.zenburn):"zenburn - Power By 老贺",
    HighlighterStyle.fromColors(HighlighterStyle.mf):"mf - Power By MF",
    HighlighterStyle.fromColors(HighlighterStyle.solarized):"cst - Power By cst",
  };


  static final themeColorSupport = <MaterialColor, String>{
    Colors.red: "毁灭之红",
    Colors.orange: "愤怒之橙",
    Colors.yellow: "警告之黄",
    Colors.green: "伪装之绿",
    Colors.blue: "冷漠之蓝",
    Colors.indigo: "无限之靛",
    Colors.purple: "神秘之紫",

    MaterialColor(0xff2D2D2D, <int, Color>{
      50: Color(0xFF8A8A8A),
      100: Color(0xFF747474),
      200: Color(0xFF616161),
      300: Color(0xFF484848),
      400: Color(0xFF3D3D3D),
      500: Color(0xff2D2D2D),
      600: Color(0xFF252525),
      700: Color(0xFF141414),
      800: Color(0xFF050505),
      900: Color(0xff000000),
    }): "归宿之黑"
  };

}

