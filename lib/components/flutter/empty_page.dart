import 'package:flutter/material.dart';

/// create by 老贺 on 2020-03-07
/// contact me by email 744359304@qq.com
/// 说明: 

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 300,
      alignment: Alignment.center,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             Icon(Icons.style, color: Colors.grey, size: 80.0),
             Container(
              padding:  EdgeInsets.only(top: 16.0),
              child:  Text(
                "暂无数据",
                style:  TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
    );
  }
}
