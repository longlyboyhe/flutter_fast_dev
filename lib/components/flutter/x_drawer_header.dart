import 'package:flutter/material.dart';

/// create by 老贺 on 2020-04-22
/// contact me by email 744359304@qq.com
/// 说明: 

class XDrawerHeader extends StatelessWidget {
  final Color color;


  XDrawerHeader({this.color});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.only(top: 10, left: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/wy_300x200_filter.webp'),
            fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              FlutterLogo(
//                colors: Colors.orange,
                size: 35,
              ),
              Text(
                'Flutter Unit',
                style: TextStyle(fontSize: 24, color: Colors.white, shadows: [
                  Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                      blurRadius: 3)
                ]),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'The Unity Of Flutter, The Unity Of Coder.',
            style: TextStyle(fontSize: 15, color: Colors.white, shadows: [
              Shadow(color: color, offset: Offset(.5, .5), blurRadius: 1)
            ]),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Flutter的联合，编程者的联合。',
            style: TextStyle(fontSize: 15, color: Colors.white, shadows: [
              Shadow(color: color, offset: Offset(.5, .5), blurRadius: 1)
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Spacer(
                flex: 5,
              ),
              Text(
                '—— 老贺',
                style: TextStyle(fontSize: 15, color: Colors.white, shadows: [
                  Shadow(
                      color: Colors.orangeAccent,
                      offset: Offset(.5, .5),
                      blurRadius: 1)
                ]),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
