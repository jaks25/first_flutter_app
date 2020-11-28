import 'package:first_flutter_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/Screens/Home/home_screen.dart';

class Body extends State{
  Body(this.context);

  final BuildContext context;
  @override
  Widget build(context) {
    Size size = MediaQuery.of(context).size;
    double xOffset = 0;
    double yOffset = 0;
    double scaleFactor = 1;

    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.02,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width*0.03, vertical: size.height *0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.menu), onPressed: () {
                  setState((){
                    xOffset = size.width * 0.5;
                    yOffset = size.height * 0.5;
                    scaleFactor = 0.6;
                  });
                  print("Pushed");
                },)
              ],
            )
          )
        ],
      ),
    );
  }
}