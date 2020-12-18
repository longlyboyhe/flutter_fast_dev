import 'dart:convert';
import 'dart:io';

/// http请求
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_fast_dev/app/common/constant.dart';
import 'package:flutter_fast_dev/app/utils/net_util.dart';
import 'package:flutter_fast_dev/model/base_model.dart';

import 'log_interceptors.dart';

final dioManager = DioCacheManager(
    CacheConfig(
        skipDiskCache: true
    )
);

/// 请求方法.
class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

///Http配置.
class HttpConfig {
  /// constructor.
  HttpConfig({
    this.status,
    this.code,
    this.msg,
    this.data,
    this.options,
    this.pem,
    this.pKCSPath,
    this.pKCSPwd,
  });
  /// BaseResp [String status]字段 key, 默认：status.
  String status;
  /// BaseResp [int code]字段 key, 默认：errorCode.
  String code;
  /// BaseResp [String msg]字段 key, 默认：errorMsg.
  String msg;
  /// BaseResp [T data]字段 key, 默认：data.
  String data;
  /// Options.
  Options options;
  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PEM证书内容.
  String pem;
  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PKCS12 证书路径.
  String pKCSPath;
  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PKCS12 证书密码.
  String pKCSPwd;
}

class HttpManager {
  static HttpManager _instance;

  factory HttpManager() => _getInstance();

  static HttpManager _getInstance() {
    if (_instance == null) {
      _instance = new HttpManager._();
    }
    return _instance;
  }

  HttpManager._() {
    dio = _createInstance();
  }

  /// global dio object
  static Dio dio;
  static const int _CONNECT_TIMEOUT = 15000;
  static const int _RECEIVE_TIMEOUT = 15000;

  static const String NETWORK_ERROR = '网络中断,请检查网络';
  /// 是否是debug模式.
  static  bool _isDebug = false;

  /// 打开debug模式.
  static void openDebug() {
    _isDebug = true;
  }

  void setCookie(String cookie) {
    Map<String, dynamic> _headers = new Map();
    _headers["Cookie"] = cookie;
    dio.options.headers.addAll(_headers);
  }


  Future<BaseResponse<T>> get<T>(
      String url,
      {Map<String, dynamic> param,Options options, CancelToken cancelToken}
      ) async {
    return _requestHttp<T>(
      url,
      queryParameters: param,
      method: Method.get
    );
  }

  Future<BaseResponse<T>> post<T>(
      String url,
     {param,Options options, CancelToken cancelToken}
      ) async {
    return _requestHttp(
      url,
      data: param,
      method: Method.post
    );
  }

  /// T is Map<String,dynamic>  or List<dynamic>
  Future<BaseResponse<T>> _requestHttp<T>(
      String url, {
        Map<String, dynamic> queryParameters,
        data,
        method
      }) async {

    dio = _createInstance();
    var options = BaseOptions(
      connectTimeout: _CONNECT_TIMEOUT,
      receiveTimeout: _RECEIVE_TIMEOUT,
      /// plain: Transform the response data to a String encoded with UTF8.
      responseType: ResponseType.plain,
//        contentType: Headers.jsonContentType,
      headers: {
        "terminal": "Android",
        "Authorization": 'token',
      },
    );
    if(!url.startsWith("http")&&!url.startsWith("https")){
      options.baseUrl = Cons.baseUrl;
    }
    dio.options = options;
    try {
      Response response = await dio.request(
        url,
        queryParameters: queryParameters,
        data: data,
        options: new Options(method: method),
      );
      String _status;
      int _code;
      String _msg;
      T _data;
      if (response.statusCode == HttpStatus.ok) {
        if (response.data == null || response.data == 'null') {
          return Future.error(DioError(
            response: response,
            error: "data null",
            type: DioErrorType.DEFAULT,
          ));
        } else {
          if (response.data is Map) {
            _status = (response.data["status"] is int)
                ? response.data["status"].toString()
                : response.data["status"];
            _code = (response.data["errorCode"] is String)
                ? int.tryParse(response.data["errorCode"])
                : response.data["errorCode"];
            _msg = response.data["errorMsg"];
            _data  = response.data["data"];
          } else {
            Map<String, dynamic> _dataMap = _decodeData(response);
            _status = (_dataMap["status"] is int)
                ? _dataMap["status"].toString()
                : _dataMap["status"];
            _code = (_dataMap["errorCode"] is String)
                ? int.tryParse(_dataMap["errorCode"])
                : _dataMap["errorCode"];
            _msg = _dataMap["errorMsg"];
            _data = _dataMap["data"];
          }
          return BaseResponse(data:_data,status:_status,code:_code,msg: _msg);
        }
      } else {
        return Future.error(DioError(
          response: response,
          error: "data null",
          type: DioErrorType.DEFAULT,
        ));
      }
    } on DioError catch (e) {
      /// 打印请求失败相关信息
      return Future.error(DioError(
        response: null,
        error: "请求出错:${e.toString()}",
        type: DioErrorType.DEFAULT,
      ));
    }
  }

  /// 创建 dio 实例对象
  static Dio _createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      dio = Dio();
      ///添加拦截器
      dio.interceptors
        ..add(LogInterceptors())
        ..add(dioManager.interceptor);
    }
    return dio;
  }

  /// decode response data.
  Map<String, dynamic> _decodeData(Response response) {
    if (response == null ||
        response.data == null ||
        response.data.toString().isEmpty) {
      return new Map();
    }
    return json.decode(response.data.toString());
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}