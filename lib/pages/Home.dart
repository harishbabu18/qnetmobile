import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:qnetmobile/pages/companydart';
import 'package:qnetmobile/pages/CompanyList.dart';



class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String status="";
  final storage = new FlutterSecureStorage();
  @override
  void initState() {
    _read().then((value){
      print('Async done');
    });
    super.initState();
  }

  _read() async {
    final key = 'user_tokken';
    final value =  await storage.read(key: key) ?? 0;

    this.setState((){
      status =value;
    });

  }

  void delete(){
    _delete();
  }

  _delete() async {
     Navigator.of(context).pushNamed("login");
     await storage.deleteAll();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: <Widget>[
              Container(
//              padding: const EdgeInsets.all(8),
                child: IconButton(icon: Icon(Icons.business),onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CompanyList()),
                  );
                },),
                color: Colors.yellow,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: IconButton(icon: Icon(Icons.contacts),onPressed: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompanyList()),
                  );
                  },),
                color: Colors.yellow,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: IconButton(icon: Icon(Icons.add),onPressed: (){},),
                color: Colors.yellow,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: IconButton(icon: Icon(Icons.add),onPressed: (){},),
                color: Colors.yellow,
              ),


            ],
          )
      ),
        drawer: Drawer(child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
//            DrawerHeader(
//              child: Text('Drawer Header'),
//              decoration: BoxDecoration(
//                color: Colors.blueAccent,
//              ),
//            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: delete,
            ),

          ],

    ),),
    );
  }

}