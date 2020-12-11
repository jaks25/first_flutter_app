import 'package:flutter/material.dart';
import 'package:first_flutter_app/constants.dart';
import 'package:first_flutter_app/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final firebaseUser = context.watch<User>();
    return Container(
      color: kDrawerColor,
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Column(
            children: [
            SizedBox(height: size.height * 0.2),
            Row(
                children:[
                FlatButton.icon(
                    icon: Icon(Icons.add_chart, size: size.aspectRatio*50),
                    onPressed: () {
                      print("Pressed");
                    },
                    label: Text(
                      "Dodaj diagnozę",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.aspectRatio*30
                      ),
                    ),
                  ),
                ]
              ),
              Row(
                  children:[
                    FlatButton.icon(
                      icon: Icon(Icons.logout, size: size.aspectRatio*50),
                      onPressed: () {
                        context.read<AuthenticationService>().signOut();
                      },
                      label: Text(
                        "Wyloguj",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.aspectRatio*30
                        ),
                      ),
                    ),
                  ]
              ),

              SizedBox(height: size.height * 0.5),
            ]
          ),

        ],
      )
    );
  }
}