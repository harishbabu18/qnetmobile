import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:qnetmobile/model/Loginbody.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String status="";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

Future<Loginbody> loginSubmit(String url, {Map body}) async {
  Response response;
  Dio dio = new Dio();
  response = await dio.post("http://192.168.1.5:8080/api/login", data: jsonEncode(body));

  String currentStatus="";
  if(response.statusCode >= 200 && response.statusCode<=300 ){
    currentStatus="Submitted";
    final storage = new FlutterSecureStorage();
    final key = 'user_tokken';
    final value = response.data.toString();
    await storage.deleteAll();
    await storage.write(key: key, value: value);
    print('saved $value');

    Timer.run(() {
      Navigator.of(context).pushNamed("dashboard");
    });

  }else {

    currentStatus="Wrong Password";
  }

  this.setState((){
    status =currentStatus;
  });

}
void login(){
  Loginbody userlogin = new Loginbody(username:emailController.text,password:passwordController.text);
  loginSubmit("https://api.teraret.com/api/login",body:userlogin.toMap());
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Container(
              margin:EdgeInsets.all(20),
              child: TextFormField(
                controller: emailController,
              decoration: InputDecoration(
                filled: true,
                //fillColor: Colors.white,
                hintText: "E-Mail",
                labelText: "E-Mail",
               border: OutlineInputBorder(
                 borderRadius: new BorderRadius.circular(0),
                 borderSide: new BorderSide(
                 ),
               ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2,
                      color: Colors.indigo
                    )
                ),
              ),
            ),
            ), Container(
              margin:EdgeInsets.all(20),
              child:PasswordField(
               controller: passwordController,
                hasFloatingPlaceholder: true,
                pattern: r'.*[@$#.*].*',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(width: 1,
                        color: Colors.black45
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2,
                        color: Colors.indigo
                    )
                ),
                errorMessage: 'must contain special character either . * @ # \$',
            ), ),


              Container(
                margin:EdgeInsets.all(20),
                child:ButtonTheme(
                    minWidth: 300,
                    height: 50,
                    child:RaisedButton(child: Text('Login'),onPressed: login,color: Colors.indigo,textColor: Colors.white,)
                ),)
              ,
              Container(child: Text(status),)
            ]
        ),
      ),
    );
  }

}