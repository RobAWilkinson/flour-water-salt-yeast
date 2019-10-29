part of my_app;

class BreadPage extends StatelessWidget {
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
    {
      'name': 'Wheat Bread',
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