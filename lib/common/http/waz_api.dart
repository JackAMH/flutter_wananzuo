
import 'package:flutter_wananzuo/common/http/http_manager.dart';

class WAZApi{
  static const  BASE_URL ="https://www.wanandroid.com/";
  static const BANNERS ="banner/json";
  static const ARTICLES ="article/list/";

  static HttpManager _httpManager;

  static init( )async{
    _httpManager = HttpManager.get();
    await (_httpManager.initHttp());
  }

  static getBanners()async{
    return await _httpManager.request(BANNERS);
  }

  static getArticles(int pageNo)async{
    String url = "$ARTICLES/$pageNo/json";
    return await _httpManager.request(url);
  }




}