import 'package:first_flutter_app/Screens/Welcome/components/background.dart';
import 'package:first_flutter_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/components/rounded_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget> [
            Align(
              alignment: Alignment.center,
            ),
            SizedBox(height: size.height * 0.09),
            RoundedButton(
              text: "LOGIN",
              textColor: kPrimaryLightColor,
              press: () {},
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: "SIGN IN",
              color: kPrimaryLightColor,
              textColor: kPrimaryColor,
              press: () {},
            ),
            SizedBox(height: size.height * 0.1),
          ],
    ));
  }
}



