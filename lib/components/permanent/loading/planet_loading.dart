import 'dart:math';
import 'package:flutter/material.dart';

import '../circle.dart';
import '../math_runner.dart';

/// create by 老贺 on 2020/10/24
/// contact me by email 744359304@qq.com
/// 说明:

class PlateLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: Stack(alignment: Alignment.center, children: [
        Text('loading ...'),
        MathRunner(
            reverse: false,
            f: (t) => 0.4*cos(t * pi),
            g: (t) => 0.7 * sin(t * pi),
            child: Circle(color: Colors.blue,radius: 8,)),

        MathRunner(
            reverse: false,
            f: (t) => 0.7 * cos(t * pi),
            g: (t) => 1 * sin(t * pi),
            child: Circle(color: Colors.yellow,radius: 8,)),
        MathRunner(
            reverse: false,
            f: (t) => -0.8 *cos(t * pi),
            g: (t) => 1 * sin(t * pi),
            child: Circle(color: Colors.red,radius: 8,)),
        MathRunner(
            reverse: false,
            f: (t) => 1*cos(t * pi),
            g: (t) => 0.7 * sin(t * pi),
            child: Circle(color: Colors.green,radius: 8,)),

        MathRunner(
            reverse: false,
            f: (t) => 1 * cos(t * pi),
            g: (t) => -0.7 * sin(t * pi),
            child: Circle(color: Colors.purple,radius: 8,)),
      ]),
    );
  }
}
