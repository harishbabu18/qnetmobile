import 'package:flutter/material.dart';
import 'package:qnetmobile/pages/companydart';
import 'package:qnetmobile/pages/Home.dart';
import 'package:qnetmobile/pages/Intro.dart';
import 'package:qnetmobile/pages/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Intro(title: 'QNet'),
        routes: <String, WidgetBuilder> {
          "login" : (BuildContext context) => new Login(title: 'QNet'),
          "dashboard" : (BuildContext context) => new Home(title: 'QNet'),
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    
    
    
    
    
    return Scaffold(
      appBar: AppBar(
        
        
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.count(crossAxisCount: 2,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: IconButton(icon: Icon(Icons.add),onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Company()),
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
            Container(
              padding: const EdgeInsets.all(8),
              child: IconButton(icon: Icon(Icons.add),onPressed: (){},),
              color: Colors.yellow,
            ),


          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
