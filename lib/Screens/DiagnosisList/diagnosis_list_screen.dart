import 'package:flutter/material.dart';
import 'package:first_flutter_app/Screens/DiagnosisList/components/body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class DiagnosisListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    return Scaffold(
      body: Body(),
    );
  }
}