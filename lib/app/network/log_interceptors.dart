import 'package:dio/dio.dart';

///日志拦截器
class LogInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print("---------------------Http Request Log Begin------------------------");
    print("【请求url】${options.baseUrl}${options.path}");
//    print("【请求path】${options.path}");
    print("【请求headers】${options.headers.toString()}");
    print("【请求参数query】${options.queryParameters.toString()}");
    print("【请求参数data】${options.data.toString()}");
    print("---------------------Http Request Log End------------------------");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print("---------------------Http Response Log Begin------------------------");
    print("【返回statusCode】${response.statusCode}");
    print("【返回statusMessage】${response.statusMessage}");
    print("【返回headers】${response.headers.toString()}");
    print("【返回extra】${response.extra.toString()}");
    print("【返回data】${response.data.toString()}");
    print("---------------------Http Response Log End------------------------");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print(err.toString());
    print(err.response?.toString());
    return super.onError(err);
  }
}