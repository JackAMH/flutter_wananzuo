import 'package:flutter/material.dart';
import 'package:flutter_wananzuo/common/http/waz_api.dart';
import 'package:flutter_wananzuo/ui/waz_page.dart';

class WelcomePage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WelcomeStat();
  }
}

class WelcomeStat extends State<WelcomePage>{

  @override
  void initState() {
    super.initState();
    WAZApi.init();
    initAppData();
  }

  initAppData() async{
    Iterable<Future> future = [WAZApi.init(),
    Future.delayed(Duration(seconds: 3))];// 等待6秒
    await Future.wait(future);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
      return WAZPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Image.asset("assets/images/welcome.jpg",
        fit: BoxFit.fitHeight,),
    );
  }
}