import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fast_dev/app/router.dart';
import 'package:flutter_fast_dev/blocs/bloc_exp.dart';
import 'package:flutter_fast_dev/views/pages/splash/x_splash.dart';

/// create by 老贺
/// 说明: 主程序

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(builder: (_, state) {
      return MaterialApp(
            showPerformanceOverlay: state.showPerformanceOverlay,
            title: 'Flutter Widgets',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: XRouter.generateRoute,
            theme: ThemeData(
              primarySwatch: state.themeColor,
              fontFamily: state.fontFamily,
            ),
            home: XSplash(),
      );
    });
  }

}
