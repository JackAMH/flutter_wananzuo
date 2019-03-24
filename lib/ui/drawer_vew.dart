

import 'package:flutter/material.dart';
import 'package:flutter_wananzuo/ui/login_page.dart';

class MainDrawer extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainDrawerState();
  }

}

class MainDrawerState extends State<MainDrawer>{
  String _userName;


  void _itemClick(){
    var dstPage = _userName == null? LoginPage() :null;
    Navigator.push(context,
        MaterialPageRoute(builder: (cxt){
          return  dstPage;
        }));
  }

  @override
  Widget build(BuildContext context) {
    var topView =DrawerHeader(
      decoration: BoxDecoration(
          color: Colors.pink
      ),
      child:InkWell(
        onTap: (){
          _itemClick();
        },
        child:  Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.png"),
              radius: 38.0,
            ),
            Text("请先登陆")
          ],
        ),
      )

     ,
    );
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        topView,
        InkWell(
          onTap: (){},
          child: ListTile(
            leading: Icon(Icons.favorite),
            title: Text("收藏"),),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(18.0, 0, 18.0, 0),
          child:  Divider(color:Colors.pink),
        ),
        Offstage(
          offstage: _userName == null? true :false,
          child: InkWell(
            onTap: (){},
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("退出登陆"),),
          ),
        ),



      ],
    );
  }
}