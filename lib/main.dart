import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Hello World App',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final recipes = [
    {
      'name': 'White Bread',
      'steps': [
        {'text': 'annealease'},
        {'text': 'knead'},
        {'text': 'rise'},
        {'text': 'cook'}
      ]
    },
  ];
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
            children: recipes.map(_recipeBuilder).toList()),
      ),
    );
  }

  Widget _recipeBuilder(Map<String, Object> recipe) {
    final String name = recipe['name'];
    final List<Map<String, Object>> steps = recipe['steps'];
    return Card(
        child: Container(
            padding: EdgeInsets.all(20),
            child: ListBody(children: <Widget>[
              Text("Recipe: $name"),
              ...steps.map(_stepBuilder).toList()
            ])));
  }

  Widget _stepBuilder(Map<String, Object> step) {
    final String stepText = step['text'];
    return Text('Step: $stepText');
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
