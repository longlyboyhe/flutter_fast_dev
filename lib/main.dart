import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_dev/views/bloc_wrapper.dart';
import 'package:flutter_fast_dev/views/pages/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //滚动性能优化 1.22.0
  GestureBinding.instance.resamplingEnabled = true;
  runApp(BlocWrapper(child: MyApp()));
}
