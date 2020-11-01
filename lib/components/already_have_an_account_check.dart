import 'package:flutter/material.dart';
import 'package:first_flutter_app/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Nie masz konta? " : "Masz już konto? ",
          style: TextStyle(color:kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
              login ? "Zarejestruj się" : "Zaloguj się",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              )
          ),
        ),
      ],
    );
  }
}