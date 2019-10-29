part of my_app;


class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn, this.signOutHandler});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  final VoidCallback signOutHandler;


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
              RaisedButton(child: Text("Sign In"), onPressed: () {
                widget.auth.signInWithGoogle();
                widget.onSignedIn();
              }),
            ]
      ),
    ));
  }
}
