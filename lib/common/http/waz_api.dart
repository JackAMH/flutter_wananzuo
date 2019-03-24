
import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wananzuo/common/http/http_manager.dart';

class WAZApi{
  static const  BASE_URL ="https://www.wanandroid.com/";
  static const BANNERS ="banner/json";
  static const ARTICLES ="article/list";
  static const LOGIN = "user/login";
  static const REGISTER = "uuser/register";

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

  static login()async{
    return await _httpManager.request(LOGIN);
  }

  static register(String userName,String pwd1,String pwd2)async{
    Map<String,String> parms = LinkedHashMap();
    parms["username"] = userName;
    parms["password"] = pwd1;
    parms["repassword"] = pwd2;
    var formData = FormData.from(parms);
    return await _httpManager.request(REGISTER);
  }



}