import 'package:flutter/material.dart';
import 'package:first_flutter_app/Screens/Login/components/body.dart';
import 'package:first_flutter_app/Screens/Signedin/signedin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return SignedinScreen();
    }else {
      return Scaffold(
        body: Body(),
      );
    }

  }
}

