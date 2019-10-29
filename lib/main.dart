import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    title: 'Hello World App',
    home:  MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text('Amys App'),
      ),
      body:  Container(
        padding: EdgeInsets.all(20.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[ AwesomeButton(),

          ],
        ),
      ),
    );
  }
}

class AwesomeButton extends StatefulWidget {
  @override
  AwesomeButtonState createState() {
    return  AwesomeButtonState();
  }
}

class AwesomeButtonState extends State<AwesomeButton> {
  int counter = 0;
  List<String> strings = ["Flutter", "Is", "Awesome"];
  var displayedString = "";

  onPressed() {
    setState(() {
      displayedString = strings[counter];
      counter = counter < 2 ? counter + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
        child:  Text(displayedString), onPressed: onPressed);
  }
}
