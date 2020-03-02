import 'package:dio/dio.dart';
import 'dart:collection';
import 'package:lovetv_app/net/code.dart';
import 'package:lovetv_app/dao/result_data.dart';
//http 请求

class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  Dio _dio = new Dio(); // 使用默认配置

 //发起网络请求

  netFecth(url,params,Map<String,dynamic> header, Options options,{noTip = false}) async {
    Map<String, dynamic> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    } else {
      options = new Options(method: 'get');
      options.headers = header;
    }

    resultError(DioError e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      return new ResultData(Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip), false, errorResponse.statusCode);
    }

    Response response;
    try {
      response = await _dio.request(url,data: params,options: options);
    } on DioError catch (e) {
      return resultError(e);
    }
    if(response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;

  }

}

final HttpManager httpManager = new HttpManager();
