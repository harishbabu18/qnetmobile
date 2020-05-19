import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class Intro extends StatefulWidget {
  Intro({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final storage = new FlutterSecureStorage();


  @override
  void initState() {
    super.initState();
_read();
  }

  _read() async {
    final key = 'user_tokken';
    final value =  await storage.read(key: key) ?? 0;

    if(value==0){

      Timer.run(() {
        Navigator.of(context).pushNamed("login");
      });

    } else {

      Timer.run(() {
        Navigator.of(context).pushNamed("dashboard");
      });

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child:Center(child: Text("Welcome") ,),),
    );
  }

}