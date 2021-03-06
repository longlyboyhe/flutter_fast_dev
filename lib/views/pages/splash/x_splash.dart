
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fast_dev/app/router.dart';
import 'package:flutter_fast_dev/views/pages/splash/splash_paint.dart';

/// create by 老贺 on 2020-03-07
/// contact me by email 744358304@qq.com
/// 说明: app 闪屏页
/// 动画看着不错，是从别人那里直接拿过来的

class XSplash extends StatefulWidget {
  final double size;

  XSplash({this.size = 200});

  @override
  _XSplashState createState() => _XSplashState();
}

class _XSplashState extends State<XSplash> with TickerProviderStateMixin {
  AnimationController _controller;
  double _factor;
  Animation _curveAnim;

  bool _animEnd = false;

  @override
  void initState() {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    _controller =
        AnimationController(duration: Duration(milliseconds: 1000), vsync: this)
          ..addListener(_listenAnimation)
          ..addStatusListener(_listenStatus)
          ..forward();

    _curveAnim = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    super.initState();
  }

  void _listenAnimation() {
    setState(() {
      return _factor = _curveAnim.value;
    });
  }

  void _listenStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() {
        _animEnd = true;
        Future.delayed(Duration(milliseconds: 500)).then((e) {
          Navigator.of(context).pushReplacementNamed(XRouter.nav);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double winH = MediaQuery.of(context).size.height;
    final double winW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _buildLogo(Colors.blue),
          Container(
            width: winW,
            height: winH,
            child: CustomPaint(
              painter: SplashPainter(factor: _factor),
            ),
          ),
          _buildText(winH, winW),
          _buildHead(),
          _buildPower(),
        ],
      ),
    );
  }

  Widget _buildText(double winH, double winW) {
    final shadowStyle = TextStyle(
      fontSize: 45,
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,
      shadows: [
        const Shadow(
          color: Colors.grey,
          offset: Offset(1.0, 1.0),
          blurRadius: 1.0,
        )
      ],
    );

    return Positioned(
      top: winH / 1.4,
      child: AnimatedOpacity(
          duration: const Duration(milliseconds: 600),
          opacity: _animEnd ? 1.0 : 0.0,
          child: Text(
            'Flutter Faster',
            style: shadowStyle,
          )),
    );
  }

  final colors = [Colors.red, Colors.yellow, Colors.blue];

  Widget _buildLogo(Color primaryColor) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0),
        end: const Offset(0, -1.5),
      ).animate(_controller),
      child: RotationTransition(
          turns: _controller,
          child: ScaleTransition(
            scale: Tween(begin: 2.0, end: 1.0).animate(_controller),
            child: FadeTransition(
                opacity: _controller,
                child: Container(
                  height: 120,
                  child: FlutterLogo(
                    size: 60,
                  ),
                )),
          )),
    );
  }

  Widget _buildHead() => SlideTransition(
      position: Tween<Offset>(
        end: const Offset(0, 0),
        begin: const Offset(0, -5),
      ).animate(_controller),
      child: Container(
        height: 45,
        width: 45,
        child: Image.asset('assets/images/icon_head.webp'),
      ));

  Widget _buildPower() => Positioned(
        bottom: 30,
        right: 30,
        child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _animEnd ? 1.0 : 0.0,
            child: const Text("Power By 老贺",
                style: TextStyle(
                    color: Colors.grey,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          blurRadius: 1,
                          offset: Offset(0.3, 0.3))
                    ],
                    fontSize: 16))),
      );
}
