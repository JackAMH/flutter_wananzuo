import 'package:banner_view/banner_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wananzuo/common/http/http_manager.dart';
import 'package:flutter_wananzuo/ui/welcome.dart';
import 'package:toast/toast.dart';
void main() => runApp(WAZApp());

class WAZApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage()
    );
  }
}


