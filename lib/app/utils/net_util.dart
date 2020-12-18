import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

class NetworkUtil {

  /// 判断网络是否可用,可以尝试链接您当前域名。如：baidu.com
  static Future<bool> isNetworkAvailable() async {
    try {
      final result = await InternetAddress.lookup("baidu.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      print("Network is error.");
      return false;
    }
  }

  /// 判断网络是否可用
  static Future<bool> isNetworkChangeAvailable() async {
    bool isConnectServerAvailable = false;
    try {
      var onConnectivityChanged = await (Connectivity().onConnectivityChanged);
      onConnectivityChanged.listen((ConnectivityResult result) {
        print('=======' + result.toString());
        if (result == ConnectivityResult.none) {
          ///Device not connected to any network
          isConnectServerAvailable = false;
        } else {
          ///连接wifi或mobild
          isConnectServerAvailable = true;
        }
      });
    } on SocketException catch (_) {
      print("Network is error.");
      return false;
    }
    return isConnectServerAvailable;
  }

  ///获取网络类型
  static Future<int> networkType() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
            return 1;
          } else if (connectivityResult == ConnectivityResult.wifi) {
            return 2;
          } else {
            return 0;
          }
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
