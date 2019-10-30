part of my_app;
final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ['email']
);
final FirebaseAuth _auth = FirebaseAuth.instance;

abstract class BaseAuth {
  Future<String> signInWithEmailAndPasswrd(String email, String password);
  Future<String> signInWithGoogle();
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<FirebaseUser> currentUser();
  void signOut();
}

class Auth implements BaseAuth {
  Future<String> signInWithGoogle() async {
    return (await _handleSignIn()).uid;
  }
  Future<String> signInWithEmailAndPasswrd(String email, String password) async {
    return (await _auth.signInWithEmailAndPassword(email: email, password: password)).user.uid;
  }
  Future<String> createUserWithEmailAndPassword(String email, String password) async {
    return (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user.uid;
  }
  Future<FirebaseUser> currentUser()async {
    return (await _auth.currentUser());
  }
  void signOut() {
    _auth.signOut();
  }
}


Future<FirebaseUser> _handleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  return user;
}