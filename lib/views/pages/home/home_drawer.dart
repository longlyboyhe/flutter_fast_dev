import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fast_dev/app/router.dart';
import 'package:flutter_fast_dev/blocs/home/home_exp.dart';
import 'package:flutter_fast_dev/components/flutter/no_div_expansion_tile.dart';
import 'package:flutter_fast_dev/components/flutter/x_drawer_header.dart';

/// create by 老贺 on 2020-03-26
/// contact me by email 744359304@qq.com
/// 说明:

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    final Color color = BlocProvider.of<HomeBloc>(context).activeHomeColor;

    return Container(
      color: color.withAlpha(33),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          XDrawerHeader(color: color),
          _buildItem(context, Icons.settings, '应用设置', XRouter.setting),
          Divider(height: 1),
          _buildFlutterUnit(context),
          _buildItem(context, Icons.category, 'Dart 手册', null),
          Divider(height: 1),
          _buildItem(context, Icons.info, '关于应用', XRouter.about_app),
          _buildItem(context, Icons.account_box_outlined, '联系', XRouter.about_me),
        ],
      ),
    );
  }

  Widget _buildFlutterUnit(BuildContext context) => NoBorderExpansionTile(
        backgroundColor: Colors.white70,
        leading: Icon(
          Icons.extension,
          color: Theme.of(context).primaryColor,
        ),
        title: Text('Flutter 集录'),
        children: <Widget>[
          _buildItem(context, Icons.palette, '绘画集录', XRouter.galley),
          _buildItem(context, Icons.widgets, '布局集录', XRouter.layout),
        ],
      );

  Widget _buildItem(
          BuildContext context, IconData icon, String title, String linkTo,
          {VoidCallback onTap}) =>
      ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(title),
        trailing:
            Icon(Icons.chevron_right, color: Theme.of(context).primaryColor),
        onTap: () {
          if (linkTo != null && linkTo.isNotEmpty) {
            Navigator.of(context).pushNamed(linkTo);
            if (onTap != null) onTap();
          }
        },
      );
}
