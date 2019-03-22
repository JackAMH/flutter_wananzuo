import 'package:banner_view/banner_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wananzuo/common/http/waz_api.dart';
import 'package:flutter_wananzuo/ui/article.dart';
import 'package:flutter_wananzuo/ui/drawer_vew.dart';
import 'package:toast/toast.dart';

class WAZPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => WAZState();
}

class WAZState extends State<StatefulWidget>{
  int pageNo = 0;
  List banList = [];
  List artList = [];

  @override
  void initState() {
    super.initState();
    requestData();
  }

  requestData()async{
    Iterable<Future> futures = [ _getBanners(), _getArticles()];
    await Future.wait(futures);
    setState(() {
    });
  }

  _getBanners({bool update = false})async{
   var bans = await WAZApi.getBanners();
   if(bans != null ){
     banList.addAll(bans["data"]);
     if(update){
        setState(() {
     });
     }
   }
  }

  _getArticles({bool update = false})async{
    var articles = await WAZApi.getArticles(pageNo);
    if(articles != null){
      var data = articles["data"];
      var datas =data["datas"];
      artList.addAll(datas);
      if(update){
        setState(() {
        });
      }
    }
  }

  Widget _buildItem(int i){
    if(i == 0){
      return
        Container(
          height: 180,
          child:_bannerView() ,
        );
    }
    if(artList.length >0){
      return ArticleView(artList[i-1]);
    }
    return null;
  }
  
  @override
  Widget build(BuildContext context) {

    Widget diver = Divider(color: Colors.pink,);
    Widget diver2 = Divider(color: Colors.yellow,);

    return Scaffold(
      drawer: Drawer(
        child:MainDrawer(),
      ),
      appBar: AppBar(title: Text("WAZ"),
        centerTitle: true  ,
          ),
        body: ListView.separated(
          separatorBuilder: (cxt,index){
            return index %2 == 0?diver2 :diver;
          },
          itemCount: artList.length +1,
          itemBuilder:(BuildContext cxt,int index){
            return _buildItem(index);
          },
      )
    );
  }


  Widget _bannerView(){
    var list = banList.map((item){
      String filePath = item["imagePath"];
      print(filePath);
      return InkWell(
       /* onTap: (){
          Toast.show("click", context);
        },*/
        child: Image.network(filePath,
          fit: BoxFit.cover,),
      );
    }).toList();
    return list.isNotEmpty? BannerView(list,intervalDuration: Duration(seconds: 4),
    ):null;
  }


/*
   return ListView.builder(
        itemBuilder:(BuildContext cxt,int index){
          return InkWell(
            onTap: (){
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text("tab"))
              );
            },
            child: ListTile(title: Text("$index"))
          );
        }
    );
ListView(
  itemExtent: 100,
  shrinkWrap: true,
  padding: const EdgeInsets.all(20),
  children: <Widget>[
  Container(color:Colors.yellow,
  child:const Text("hello"),),
  const Text("hello"),
  ],
  );*/
}
