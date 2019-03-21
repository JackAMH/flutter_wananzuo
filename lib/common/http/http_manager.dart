import 'package:dio/dio.dart';
import 'package:flutter_wananzuo/common/http/waz_api.dart';
class HttpManager{

  static HttpManager _instance;
  Dio _dio;

  factory HttpManager.get(){
    if(_instance == null){
      _instance = HttpManager._inst();
    }
    return _instance;
  }
  HttpManager._inst(){

  }
  initHttp()async{
    var options = BaseOptions(
        baseUrl: WAZApi.BASE_URL,
        connectTimeout: 5000,
        receiveTimeout: 3000
    );
    _dio =Dio(options);
  }

  request(String url,{data,String way ="GET"}) async{
    try{
      Options ops =Options(method: way);
      var rep = await _dio.request(url,
          data: data,
          options: ops);
      return rep.data;
    }catch (e){
      print(e);
      return null;
    }

  }



}