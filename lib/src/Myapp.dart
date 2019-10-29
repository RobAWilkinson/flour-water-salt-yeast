library my_app;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


part 'auth/userAuth.dart';
part './LoginPage.dart';
part './BreadPage.dart';
part './MeatPage.dart';



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'MyApp', home: LoginPage(auth: new Auth()), routes: {
      "/bread": (BuildContext context) => BreadPage(),
      "/two": (BuildContext context) => PageTwo()
    });
  }
}


