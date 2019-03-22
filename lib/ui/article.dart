
import 'package:flutter/material.dart';

class ArticleView extends StatelessWidget{
  final articleData;

  const ArticleView( this.articleData);

  @override
  Widget build(BuildContext context) {

    DateTime dt =DateTime.fromMicrosecondsSinceEpoch(
        articleData["publishTime"] *1000);
    String strTm = dt.toString();
    strTm = strTm.substring(0,strTm.length - 4);
    return
        InkWell(
          onTap: (){

          },
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(child:   Text(articleData["title"],
                  maxLines: 1,overflow: TextOverflow.ellipsis,
                 ),),
                InkWell(
                  onTap: (){},
                  child:Icon(Icons.favorite),)
              ],),
              Text("主章节：${articleData["superChapterName"]}"),
              Text("章节：${articleData["chapterName"]}"),
              Row(children: <Widget>[
                Expanded(child:  Text("作者：${articleData["author"]}"),),
                Text(strTm)

              ],)
            ],
          ) ,),
        );
  }

}