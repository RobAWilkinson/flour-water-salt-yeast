import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'Hello World App',
      home: new myApp(),
    )
  );
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Amys App'),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new MyCard(icon: Icon(Icons.ac_unit, size: 40, color: Colors.amber,), title: new Text("test", style: new TextStyle(fontWeight: FontWeight.bold),)),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final Widget title;
  final Widget icon;
  MyCard({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(bottom: 20.0),
      child: new Card(
        child: new Container(
          padding: new EdgeInsets.all(5.0),
          child: new Column(
            children: <Widget>[
              this.title,
              this.icon
            ],
          )
        ),
      ),

    );
  }

}