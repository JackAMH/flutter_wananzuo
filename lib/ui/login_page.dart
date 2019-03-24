

import 'package:flutter/material.dart';
import 'package:flutter_wananzuo/common/http/waz_api.dart';
import 'package:flutter_wananzuo/ui/register_page.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
  
}


class LoginState extends State<LoginPage>{
  final _formKey =GlobalKey<FormState>();
  String _username ="wqwq",_password;
  FocusNode _pwdNode = FocusNode();

  bool _isObscure = true;
  Color _pwdIconColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("登陆",),
      ),
      body: Form(
        key: _formKey,
          child: ListView(
            children: <Widget>[
             _buildUserName(),
             _buildPwd(),
             _buildLogin(),_buildRegister()
            ],
          )),
    );
  }

  Widget _buildRegister(){
    return Padding(
      padding: EdgeInsets.only(top: 10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("没有账号？"),
          GestureDetector(
            child:Text("快速注册",
            style: TextStyle(color: Colors.green  ),),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return RegisterPage();
              }));
          },
          )

        ],
      ),
    );
  }

  Widget _buildLogin(){
    return Container(
      height: 45.0,
      margin: EdgeInsets.only(top: 18.0,
      left: 18.0,right: 8.0),
      child: RaisedButton(
        child: Text("登陆",
            style: TextStyle(fontSize:
            16.0,color: Colors.white),),
        onPressed: (){
          _doLogin();
      },color: Theme.of(context).primaryColor,),

    );
  }


  Widget _buildUserName(){
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
          labelText: '用户名'
      ),
      initialValue: _username,
      textInputAction: TextInputAction.next,
      onEditingComplete:(){
        FocusScope.of(context).requestFocus(_pwdNode);
      },
      validator: (s){
        if(s.trim().isEmpty){
          return "请输入用户名";
        }
        _username = s;
      },
    );
  }

  Widget _buildPwd(){
    return TextFormField(
      focusNode: _pwdNode,
      obscureText: _isObscure,
      decoration: InputDecoration(
          labelText: '密码',

        suffixIcon:
          IconButton(icon: Icon(Icons.remove_red_eye,
            color: _pwdIconColor,),
          onPressed: (){
            setState(() {
              _isObscure = !_isObscure;

              _pwdIconColor = _isObscure?
              Colors.grey: Theme.of(context).iconTheme.color;

            });
          },)
      ),
      textInputAction: TextInputAction.done,
      onEditingComplete:_doLogin,
      validator: (s){
        if(s.trim().isEmpty){
          return "请输入密码";
        }
        _password = s;
      },
    );
  }


  void _doLogin() async{
    _pwdNode.unfocus();

    if(_formKey.currentState.validate()){
      showDialog(context: context,barrierDismissible:
      false,builder: (_){
        return Center(child: CircularProgressIndicator(),);
      });

      await WAZApi.login();



    }

  }
  
}