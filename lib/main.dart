import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
void main() => runApp(WAZApp());

class WAZApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage>{
  List banners = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context,i) => _buildItem(i)
    );
  }


  Widget _buildItem(int i){
    if(i == 0){
      
      return _bannerView();
    }
  }

  Widget _bannerView(){
    var list = banners.map((item){
      return InkWell(
        child: Image.network("https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png"),
      );
    });
  }


}