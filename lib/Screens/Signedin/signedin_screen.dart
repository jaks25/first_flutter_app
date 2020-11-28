import 'package:flutter/material.dart';
import 'package:first_flutter_app/Screens/Drawer/drawer_screen.dart';
import 'package:first_flutter_app/Screens/Home/home_screen.dart';


class SignedinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            HomeScreen(),
          ],
        ),
      );
  }
}