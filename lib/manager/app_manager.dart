
import 'package:event_bus/event_bus.dart';
import 'package:flutter_wananzuo/common/http/waz_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppManager{
  static const String ACCOUNT = "accountName";
  static SharedPreferences pres;
  static EventBus eventBus = EventBus();

   static initApp ()async{
    await WAZApi.init();
    pres = await SharedPreferences.getInstance();
  }

  static isLogin(){
     return pres.getString(ACCOUNT) != null;
  }
}