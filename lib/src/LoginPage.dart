part of my_app;


class LoginPage extends StatefulWidget {
  LoginPage({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() => new _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

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
              RaisedButton(child: Text("Sign In"), onPressed: () => widget.auth.signInWithGoogle()),
              RaisedButton(child: Text("Bread"), onPressed: () => Navigator.of(context).pushNamed("/bread")),
              RaisedButton(child: Text("Meat"), onPressed: () => Navigator.of(context).pushNamed("/two"))
            ]
      ),
    ));
  }
}
