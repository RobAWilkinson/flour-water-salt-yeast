import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Hello World App',
    home: myApp(),
    routes: <String, WidgetBuilder>{
      "/SecondPage": (BuildContext context) => SecondPage(),
      "/ThirdPage": (BuildContext context) => ThirdPage()
    },
  ));
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("thirdpage")));
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Second Page"), backgroundColor: Colors.deepOrange),
        body: Container(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.blue),
                iconSize: 70.0,
                onPressed: null,
              ),
              Text("Second Page")
            ]))));
  }
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amys App'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AwesomeButton(),
            RaisedButton(
                child: Text("navigate to page 2"),
                onPressed: () {
                  Navigator.of(context).pushNamed("/SecondPage");
                }),
            RaisedButton(
                child: Text("navigate to page 3"),
                onPressed: () {
                  Navigator.of(context).pushNamed("/ThirdPage");
                })
          ],
        ),
      ),
    );
  }
}

class AwesomeButton extends StatefulWidget {
  @override
  AwesomeButtonState createState() {
    return AwesomeButtonState();
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
    return RaisedButton(child: Text(displayedString), onPressed: onPressed);
  }
}
