part of my_app;

class RootPage extends StatefulWidget {
  final BaseAuth auth;

  RootPage({this.auth});

  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus { notSignedIn, signedIn }

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.notSignedIn;
  FirebaseUser _user;

  void initState() {
    super.initState();
    if (widget.auth != null) {
      widget.auth.currentUser().then((userId) {
        print(userId);
        print("in root");
        setState(() {
          _authStatus =
              userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
          _user = userId;
        });
        print(_user);
      });
    }
  }

  void _signOut() {
    print("signing out");
    widget.auth.signOut();
    setState(() {
      _authStatus = AuthStatus.notSignedIn;
    });
  }

  void _onSignedIn() {
    widget.auth.currentUser().then((userId) {
      print("Signed In");
      setState(() {
        _authStatus = AuthStatus.signedIn;
        userId = userId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notSignedIn:
        return LoginPage(
            auth: widget.auth,
            onSignedIn: _onSignedIn,
            signOutHandler: _signOut);
      case AuthStatus.signedIn:
        return HomePage(_signOut, _user);
    }
    return NotFoundPage();
  }
}

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Amys App'),
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(children: <Widget>[Text("1223")])));
  }
}
