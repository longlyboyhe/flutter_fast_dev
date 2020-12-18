
class BaseResponse<T> {
  String status;
  T data;
  int code;
  String msg;

  BaseResponse({this.status,this.code, this.msg,this.data });

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"status\":\"$status\"");
    sb.write(",\"code\":$code");
    sb.write(",\"msg\":\"$msg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}
