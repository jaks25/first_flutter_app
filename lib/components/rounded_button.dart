import 'package:flutter/material.dart';
import 'package:first_flutter_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final String show;
  const RoundedButton({
    Key key,
    @required
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.show = 'y',
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return show != 'y' ? Container() :Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child:FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            color: color,
            onPressed: press,
            child: Text(
              text,
              style:TextStyle(color: textColor),
            ),
          ),
        )
    );
  }
}