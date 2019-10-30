part of my_app;

class HomePage extends StatelessWidget {

  final VoidCallback _signOutHandler;
  final FirebaseUser _user;

  HomePage(this._signOutHandler, this._user);

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
            children: [
              Text(_user.displayName),
              RaisedButton(child: Text("Bread"), onPressed: () {
                Navigator.of(context).pushNamed("/bread", arguments: {'user', _user});
              })
                ,
              RaisedButton(child: Text("Meat"), onPressed: () {
                Navigator.of(context).pushNamed("/two", arguments: { 'user': _user });
              }),
              RaisedButton(child: Text("Logout"), onPressed: () => _signOutHandler())
            ]
      ),
    ));
  }
}