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
            new AwesomeButton()
          ],
        ),
      ),
    );
  }
}

class AwesomeButton extends StatefulWidget {
  @override
  AwesomeButtonState createState() {
    return new AwesomeButtonState();
  }
}
class AwesomeButtonState extends State<AwesomeButton>{
  int counter = 0;
  List<String> strings = ["Flutter", "Is", "Awesome"];
  var displayedString = "";

onPressed() {
  setState(() {
    displayedString = strings[counter];
    counter = counter < 2 ?  counter+1 : 0; 
  });
}
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(child: new Text(displayedString), onPressed: onPressed);
  }

}